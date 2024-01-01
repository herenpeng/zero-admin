package com.zero.oauth.github.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonSetter;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import io.swagger.v3.oas.annotations.Hidden;

import java.util.Date;

/**
 * {
 * "login": "herenpeng",
 * "id": 10221541,
 * "node_id": "MDQsdsfdQ2fcvvTkx",
 * "avatar_url": "https://avatars.githubusercontent.com/u/60246991?v=4",
 * "gravatar_id": "",
 * "url": "https://api.github.com/users/herenpeng",
 * "html_url": "https://github.com/herenpeng",
 * "followers_url": "https://api.github.com/users/herenpeng/followers",
 * "following_url": "https://api.github.com/users/herenpeng/following{/other_user}",
 * "gists_url": "https://api.github.com/users/herenpeng/gists{/gist_id}",
 * "starred_url": "https://api.github.com/users/herenpeng/starred{/owner}{/repo}",
 * "subscriptions_url": "https://api.github.com/users/herenpeng/subscriptions",
 * "organizations_url": "https://api.github.com/users/herenpeng/orgs",
 * "repos_url": "https://api.github.com/users/herenpeng/repos",
 * "events_url": "https://api.github.com/users/herenpeng/events{/privacy}",
 * "received_events_url": "https://api.github.com/users/herenpeng/received_events",
 * "type": "User",
 * "site_admin": false,
 * "name": null,
 * "company": null,
 * "blog": "",
 * "location": null,
 * "email": null,
 * "hireable": null,
 * "bio": null,
 * "twitter_username": null,
 * "public_repos": 11,
 * "public_gists": 0,
 * "followers": 1,
 * "following": 0,
 * "created_at": "2020-01-24T02:49:20Z",
 * "updated_at": "2021-04-05T10:20:26Z"
 * }
 *
 * @author herenpeng
 * @since 2021-04-06 23:22
 */
@Hidden
@Schema(name = "Github用户信息表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("oauth_github_user")
public class GithubUser extends BaseEntity {

    /**
     * Github用户名称
     */
    @JsonProperty(value = "login")
    @Schema(name = "Github用户名称")
    @Excel(name = "Github用户名称", width = 15, needMerge = true)
    @TableField(value = "login")
    private String login;
    /**
     * 用户表主键
     */
    @Schema(name = "用户表主键")
    @Excel(name = "用户表主键", width = 15, needMerge = true)
    @TableField(value = "user_id")
    private Integer userId;
    /**
     * Github用户主键
     */
    @Schema(name = "Github用户主键")
    @Excel(name = "Github用户主键", width = 15, needMerge = true)
    @TableField(value = "github_id")
    private Integer githubId;

    @JsonGetter("github_id")
    public Integer getGithubId() {
        return githubId;
    }

    @JsonSetter(value = "id")
    public void setGithubId(Integer githubId) {
        this.githubId = githubId;
    }

    /**
     * Github Node主键
     */
    @JsonProperty(value = "node_id")
    @Schema(name = "Github Node主键")
    @Excel(name = "Github Node主键", width = 15, needMerge = true)
    @TableField(value = "node_id")
    private String nodeId;
    /**
     * Github 用户信息api请求路径
     */
    @JsonProperty(value = "url")
    @Schema(name = "Github 用户信息api请求路径")
    @Excel(name = "Github 用户信息api请求路径", width = 15, needMerge = true)
    @TableField(value = "url")
    private String url;
    /**
     * Github 用户主页路径
     */
    @JsonProperty(value = "html_url")
    @Schema(name = "Github 用户主页路径")
    @Excel(name = "Github 用户主页路径", width = 15, needMerge = true)
    @TableField(value = "html_url")
    private String htmlUrl;
    /**
     * Github 用户类型
     */
    @JsonProperty(value = "type")
    @Schema(name = "Github 用户类型")
    @Excel(name = "Github 用户类型", width = 15, needMerge = true)
    @TableField(value = "type")
    private String type;
    /**
     * Github 公开的仓库个数
     */
    @JsonProperty(value = "public_repos")
    @Schema(name = "Github 公开的仓库个数")
    @Excel(name = "Github 公开的仓库个数", width = 15, needMerge = true)
    @TableField(value = "public_repos")
    private Integer publicRepos;
    /**
     * 用户头像路径
     */
    @JsonProperty(value = "avatar_url")
    @Schema(name = "用户头像路径")
    @Excel(name = "用户头像路径", width = 15, needMerge = true)
    @TableField(value = "avatar_url")
    private String avatarUrl;
    /**
     * public_gists
     */
    @JsonProperty(value = "public_gists")
    @Schema(name = "public_gists")
    @Excel(name = "public_gists", width = 15, needMerge = true)
    @TableField(value = "public_gists")
    private Integer publicGists;
    /**
     * gravatar_id
     */
    @JsonProperty(value = "gravatar_id")
    @Schema(name = "gravatar_id")
    @Excel(name = "gravatar_id", width = 15, needMerge = true)
    @TableField(value = "gravatar_id")
    private Integer gravatarId;
    /**
     * followers_url
     */
    @JsonProperty(value = "followers_url")
    @Schema(name = "followers_url")
    @Excel(name = "followers_url", width = 15, needMerge = true)
    @TableField(value = "followers_url")
    private String followersUrl;
    /**
     * site_admin
     */
    @JsonProperty(value = "site_admin")
    @Schema(name = "site_admin")
    @Excel(name = "site_admin", width = 15, needMerge = true)
    @TableField(value = "site_admin")
    private Boolean siteAdmin;
    /**
     * following_url
     */
    @JsonProperty(value = "following_url")
    @Schema(name = "following_url")
    @Excel(name = "following_url", width = 15, needMerge = true)
    @TableField(value = "following_url")
    private String followingUrl;
    /**
     * gists_url
     */
    @JsonProperty(value = "gists_url")
    @Schema(name = "gists_url")
    @Excel(name = "gists_url", width = 15, needMerge = true)
    @TableField(value = "gists_url")
    private String gistsUrl;
    /**
     * starred_url
     */
    @JsonProperty(value = "starred_url")
    @Schema(name = "starred_url")
    @Excel(name = "starred_url", width = 15, needMerge = true)
    @TableField(value = "starred_url")
    private String starredUrl;
    /**
     * subscriptions_url
     */
    @JsonProperty(value = "subscriptions_url")
    @Schema(name = "subscriptions_url")
    @Excel(name = "subscriptions_url", width = 15, needMerge = true)
    @TableField(value = "subscriptions_url")
    private String subscriptionsUrl;
    /**
     * organizations_url
     */
    @JsonProperty(value = "organizations_url")
    @Schema(name = "organizations_url")
    @Excel(name = "organizations_url", width = 15, needMerge = true)
    @TableField(value = "organizations_url")
    private String organizationsUrl;
    /**
     * repos_url
     */
    @JsonProperty(value = "repos_url")
    @Schema(name = "repos_url")
    @Excel(name = "repos_url", width = 15, needMerge = true)
    @TableField(value = "repos_url")
    private String reposUrl;
    /**
     * events_url
     */
    @JsonProperty(value = "events_url")
    @Schema(name = "events_url")
    @Excel(name = "events_url", width = 15, needMerge = true)
    @TableField(value = "events_url")
    private String eventsUrl;
    /**
     * received_events_url
     */
    @JsonProperty(value = "received_events_url")
    @Schema(name = "received_events_url")
    @Excel(name = "received_events_url", width = 15, needMerge = true)
    @TableField(value = "received_events_url")
    private String receivedEventsUrl;
    /**
     * name
     */
    @JsonProperty(value = "name")
    @Schema(name = "name")
    @Excel(name = "name", width = 15, needMerge = true)
    @TableField(value = "name")
    private String name;
    /**
     * company
     */
    @JsonProperty(value = "company")
    @Schema(name = "company")
    @Excel(name = "company", width = 15, needMerge = true)
    @TableField(value = "company")
    private String company;
    /**
     * blog
     */
    @JsonProperty(value = "blog")
    @Schema(name = "blog")
    @Excel(name = "blog", width = 15, needMerge = true)
    @TableField(value = "blog")
    private String blog;
    /**
     * location
     */
    @JsonProperty(value = "location")
    @Schema(name = "location")
    @Excel(name = "location", width = 15, needMerge = true)
    @TableField(value = "location")
    private String location;
    /**
     * 邮箱
     */
    @JsonProperty(value = "email")
    @Schema(name = "邮箱")
    @Excel(name = "邮箱", width = 15, needMerge = true)
    @TableField(value = "email")
    private String email;
    /**
     * hireable
     */
    @JsonProperty(value = "hireable")
    @Schema(name = "hireable")
    @Excel(name = "hireable", width = 15, needMerge = true)
    @TableField(value = "hireable")
    private String hireable;
    /**
     * bio
     */
    @JsonProperty(value = "bio")
    @Schema(name = "bio")
    @Excel(name = "bio", width = 15, needMerge = true)
    @TableField(value = "bio")
    private String bio;
    /**
     * twitter_username
     */
    @JsonProperty(value = "twitter_username")
    @Schema(name = "twitter_username")
    @Excel(name = "twitter_username", width = 15, needMerge = true)
    @TableField(value = "twitter_username")
    private String twitterUsername;
    /**
     * followers
     */
    @JsonProperty(value = "followers")
    @Schema(name = "followers")
    @Excel(name = "followers", width = 15, needMerge = true)
    @TableField(value = "followers")
    private Integer followers;
    /**
     * following
     */
    @JsonProperty(value = "following")
    @Schema(name = "following")
    @Excel(name = "following", width = 15, needMerge = true)
    @TableField(value = "following")
    private Integer following;
    /**
     * Github账号创建时间
     */
    @JsonProperty(value = "created_at")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss'Z'")
    @Schema(name = "Github账号创建时间")
    @Excel(name = "Github账号创建时间", width = 15, needMerge = true)
    @TableField(value = "created_at")
    private Date createdAt;
    /**
     * Github最后更新时间
     */
    @JsonProperty(value = "updated_at")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss'Z'")
    @Schema(name = "Github最后更新时间")
    @Excel(name = "Github最后更新时间", width = 15, needMerge = true)
    @TableField(value = "updated_at")
    private Date updatedAt;

}
