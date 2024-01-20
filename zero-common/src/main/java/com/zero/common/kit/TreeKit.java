package com.zero.common.kit;

import com.zero.common.base.entity.BaseTreeEntity;

import java.util.*;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;

public class TreeKit {


    public static <E extends BaseTreeEntity> List<E> findChildren(Integer parentId, Function<Integer, List<E>> getByParentId) throws Exception {
        List<E> tree = getByParentId.apply(parentId);
        for (E treeNode : tree) {
            List<E> children = findChildren(treeNode.getId(), getByParentId);
            treeNode.setChildren(children);
        }
        return tree;
    }


    public static <E extends BaseTreeEntity> void move(Integer id, Integer parentId, Integer sort,
                                                       Function<Integer, E> selectById,
                                                       Function<Integer, List<E>> getByParentId,
                                                       Consumer<List<E>> updateBatchById) throws Exception {
        List<E> update = new ArrayList<>();
        List<E> treeNodes = getByParentId.apply(parentId);
        E treeNode = findNode(treeNodes, id);
        if (treeNode == null) {
            // 从别的地方移动过来的，原数组需要重新排序
            treeNode = selectById.apply(id);
            List<E> sourceTreeNodes = getByParentId.apply(treeNode.getParentId());
            sourceTreeNodes.removeIf(node -> Objects.equals(node.getId(), id));
            update.addAll(sort(sourceTreeNodes, null));
            treeNode.setParentId(parentId);
        }
        insertNode(treeNodes, treeNode, sort);
        update.addAll(sort(treeNodes, data -> Objects.equals(data.getId(), id)));
        updateBatchById.accept(update);
    }


    private static <E extends BaseTreeEntity> E findNode(List<E> treeNodes, Integer id) {
        Iterator<E> iterator = treeNodes.iterator();
        while (iterator.hasNext()) {
            E treeNode = iterator.next();
            if (Objects.equals(treeNode.getId(), id)) {
                iterator.remove();
                return treeNode;
            }
        }
        return null;
    }


    private static <E extends BaseTreeEntity> List<E> sort(List<E> treeNodes, Predicate<E> predicate) {
        List<E> update = new ArrayList<>();
        int sort = 1;
        for (E treeNode : treeNodes) {
            if ((predicate != null && predicate.test(treeNode)) || !Objects.equals(treeNode.getSort(), sort)) {
                treeNode.setSort(sort);
                update.add(treeNode);
            }
            sort++;
        }
        return update;
    }


    private static <E extends BaseTreeEntity> void insertNode(List<E> treeNodes, E treeNode, int sort) {
        treeNodes.sort(Comparator.comparingInt(E::getSort));
        int index = sort - 1;
        if (index >= 0 && index < treeNodes.size()) {
            treeNodes.add(index, treeNode);
        } else {
            // 越界
            treeNodes.add(treeNode);
        }
    }


}
