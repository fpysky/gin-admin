package model

import (
	"gin-admin/global"
	"time"
)

type Admin struct {
	global.MODEL
	Id            int       `json:"" gorm:"index;comment:"`
	Name          string    `json:"" gorm:"index;comment:"`
	Password      string    `json:"" gorm:"index;comment:"`
	Status        int       `json:"" gorm:"index;comment:"`
	Type          int       `json:"" gorm:"index;comment:"`
	Mobile        string    `json:"" gorm:"index;comment:"`
	Email         string    `json:"" gorm:"index;comment:"`
	LastLoginIp   string    `json:"" gorm:"index;comment:"`
	Logo          string    `json:"" gorm:"index;comment:"`
	DeptId        int       `json:"" gorm:"index;comment:"`
	LastLoginTime time.Time `json:"" gorm:"index;comment:"`
	CreatedAt     time.Time `json:"" gorm:"index;comment:"`
	UpdatedAt     time.Time `json:"" gorm:"index;comment:"`
	DeletedAt     time.Time `json:"" gorm:"index;comment:"`
}

func (Admin) TableName() string {
	return "ad_admin"
}
