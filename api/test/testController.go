package test

import (
	"gin-admin/global"
	"gin-admin/service"
	"gin-admin/utils"
	"gin-admin/utils/request"
	"gin-admin/utils/response"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type TestController struct{}

func (t *TestController) List(c *gin.Context) {
	pageInfo := request.PageInfo{
		Page:     1,
		PageSize: 15,
		Keyword:  "",
	}
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(pageInfo, utils.PageInfoVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	adminService := service.AdminService{}
	list, total, err := adminService.GetAdminList(pageInfo)
	if err != nil {
		global.LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}

	response.OkWithDetailed(response.PageResult{
		List:     list,
		Total:    total,
		Page:     pageInfo.Page,
		PageSize: pageInfo.PageSize,
	}, "获取成功", c)
}
