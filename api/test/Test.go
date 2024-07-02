package test

import (
	"gin-admin/utils/response"
	"github.com/gin-gonic/gin"
)

type TestApi struct{}

func (t *TestApi) Test(c *gin.Context) {
	response.OkWithMessage("sdsadaasd", c)
}
