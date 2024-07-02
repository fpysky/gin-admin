package initialize

import (
	"gin-admin/router"
	"github.com/gin-gonic/gin"
	"net/http"
)

func Routers() *gin.Engine {
	Router := gin.New()
	Router.Use(gin.Recovery())
	if gin.Mode() == gin.DebugMode {
		Router.Use(gin.Logger())
	}

	testRouter := router.RouterGroupApp.Test

	PublicGroup := Router.Group("/")
	{
		// 健康监测
		PublicGroup.GET("health", func(c *gin.Context) {
			c.JSON(http.StatusOK, "ok")
		})
	}
	{
		testRouter.InitTestRouter(PublicGroup)
	}

	println("路由注册完成")

	return Router
}
