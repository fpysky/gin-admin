CREATE TABLE `ad_admin`
(
    `id`              int unsigned NOT NULL AUTO_INCREMENT,
    `name`            varchar(50) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '用户姓名',
    `password`        varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '密码',
    `status`          tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用',
    `type`            tinyint unsigned NOT NULL DEFAULT '2' COMMENT '类型：1超级管理员（拥有所有权限） 2 其他',
    `mobile`          char(11) COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '' COMMENT '手机号码',
    `email`           varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱号码',
    `last_login_ip`   varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近登录ip',
    `logo`            varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员头像',
    `dept_id`         smallint unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
    `last_login_time` int                                     NOT NULL DEFAULT '0' COMMENT '最后登录时间',
    `created_at`      datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`      datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted_at`      datetime                                         DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员表'

CREATE TABLE `ad_admin_dept`
(
    `admin_id` int unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
    `dept_id`  int unsigned DEFAULT '0' COMMENT '部门id',
    UNIQUE KEY `ad_admin_dept_admin_id_dept_id_uindex` (`admin_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员部门中间表'

CREATE TABLE `ad_admin_login_log`
(
    `id`              int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `admin_id`        smallint unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
    `province`        varchar(10) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '省份名称',
    `city`            varchar(20) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '城市名称',
    `last_login_time` int unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
    `last_login_ip`   varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近登录ip',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员登录日志表'

CREATE TABLE `ad_admin_operation_log`
(
    `id`             int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `module`         varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模块',
    `operate_type`   int                                              DEFAULT NULL COMMENT '操作类型 1.新增 2.删除 3.修改 4.查询',
    `method`         varchar(20) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '方法',
    `admin_id`       int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
    `admin_name`     varchar(30) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '操作人姓名',
    `operate_ip`     varchar(30) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '操作IP',
    `operate_status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '操作状态 0.失败 1.成功',
    `operated_at`    datetime                                         DEFAULT NULL COMMENT '操作时间',
    `created_at`     datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`     datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted_at`     datetime                                         DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `ad_admin_role`
(
    `id`       int unsigned NOT NULL AUTO_INCREMENT,
    `role_id`  int unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
    `admin_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员角色表'

CREATE TABLE `ad_dept`
(
    `id`         smallint unsigned NOT NULL AUTO_INCREMENT,
    `parent_id`  int unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
    `status`     tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用',
    `sort`       smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
    `name`       varchar(10) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '部门名称',
    `remark`     varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
    `created_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted_at` datetime                                         DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表'

CREATE TABLE `ad_migrations`
(
    `id`        int unsigned NOT NULL AUTO_INCREMENT,
    `migration` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
    `batch`     int                                     NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `ad_post`
(
    `id`         smallint unsigned NOT NULL AUTO_INCREMENT,
    `name`       varchar(20) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '职位名称',
    `status`     tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用',
    `sort`       tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序：从小到大',
    `remark`     varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
    `created_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted_at` datetime                                         DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='职位表'

CREATE TABLE `ad_role`
(
    `id`         int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `status`     tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用',
    `sort`       tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
    `name`       varchar(20) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '角色名称',
    `desc`       varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
    `created_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted_at` datetime                                         DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表'

CREATE TABLE `ad_role_rule`
(
    `id`      int unsigned NOT NULL AUTO_INCREMENT,
    `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
    `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT '权限id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限表'

CREATE TABLE `ad_rule`
(
    `id`         int unsigned NOT NULL AUTO_INCREMENT,
    `parent_id`  int unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
    `status`     tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态：0.禁用 1.启用',
    `type`       tinyint unsigned NOT NULL DEFAULT '1' COMMENT '类型：1-菜单，2-目录，3-按钮，4-接口',
    `sort`       smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序：按照从小到大排序',
    `name`       varchar(30) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '菜单名称',
    `icon`       varchar(50) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '图标',
    `desc`       varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
    `route`      varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'api请求路由名称',
    `path`       varchar(50) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '菜单路由path',
    `created_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted_at` datetime                                         DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限表（菜单表）'

CREATE TABLE `demo_migrations`
(
    `id`        int unsigned NOT NULL AUTO_INCREMENT,
    `migration` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
    `batch`     int                                     NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

