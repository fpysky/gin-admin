package service

import (
	"gin-admin/global"
	"gin-admin/model"
	"gin-admin/utils/request"
)

type AdminService struct{}

func (adminService *AdminService) GetAdminList(info request.PageInfo) (list interface{}, total int64, err error) {
	var adminList []model.Admin
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	db := global.DB.Model(&model.Admin{})

	err = db.Count(&total).Error
	if err != nil {
		return
	}

	err = db.Limit(limit).Offset(offset).Find(&adminList).Error

	return adminList, total, err
}
