package model

import (
	"gin-admin/global"
	"gorm.io/gorm"
	"time"
)

type Admin struct {
	global.MODEL
	Id            int            `json:"id" gorm:"index;comment:id"`
	Name          string         `json:"name" gorm:"index;comment:姓名"`
	Password      string         `json:"password" gorm:"index;comment:密码"`
	Status        int            `json:"status" gorm:"index;comment:状态：0.禁用 1.启用"`
	Type          int            `json:"type" gorm:"index;comment:类型：1超级管理员（拥有所有权限） 2 其他"`
	Mobile        string         `json:"mobile" gorm:"index;comment:手机号码"`
	Email         string         `json:"email" gorm:"index;comment:邮箱号码"`
	LastLoginIp   string         `json:"last_login_ip" gorm:"index;comment:最近登录ip"`
	Logo          string         `json:"logo" gorm:"index;comment:管理员头像"`
	DeptId        int            `json:"dept_id" gorm:"index;comment:部门id"`
	LastLoginTime int            `json:"last_login_time" gorm:"index;comment:最后登录时间"`
	CreatedAt     time.Time      `gorm:"column:created_at;type:datetime;comment:创建时间" json:"created_at"`
	UpdatedAt     time.Time      `gorm:"type:datetime;default:current_timestamp on update current_timestamp"`
	DeletedAt     gorm.DeletedAt `gorm:"index"`
}

func (Admin) TableName() string {
	return "ad_admin"
}
