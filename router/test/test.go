package test

import (
	"gin-admin/api"
	"github.com/gin-gonic/gin"
)

type Test struct{}

func (t *Test) InitTestRouter(Router *gin.RouterGroup) {
	apiGroupApp := api.ApiGroupApp

	Router.GET("hello", apiGroupApp.TestApiGroup.TestController.List)
}
