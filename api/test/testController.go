package test

import (
	"gin-admin/global"
	"gin-admin/model"
	"gin-admin/utils/response"
	"github.com/gin-gonic/gin"
)

type TestController struct{}

func (t *TestController) Test(c *gin.Context) {
	var admin model.Admin
	global.DB.Where("id = ?", 1).First(&admin)
	response.OkWithMessage(admin.Name, c)
}
