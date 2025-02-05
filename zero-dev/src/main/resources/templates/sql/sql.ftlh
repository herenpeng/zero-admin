INSERT INTO `zero-admin`.`sys_menu`(`path`, `name`, `meta_title`, `meta_icon`, `sort`, `hidden`, `enabled`, `parent_id`) VALUES ('${strikeEntityName}', '${entityName}', '${comment}', 'el-icon-s-platform', 1, 0, 1, 0);

INSERT INTO `zero-admin`.`sys_menu`(`path`, `name`, `meta_title`, `meta_icon`, `sort`, `hidden`, `enabled`, `parent_id`) SELECT '${strikeEntityName}', 'Recover${entityName}', '${comment}', 'el-icon-s-platform', 1, 0, 1, id FROM `sys_menu` where path = '/recover';
