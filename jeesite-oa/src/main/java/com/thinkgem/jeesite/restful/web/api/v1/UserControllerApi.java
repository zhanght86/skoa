package com.thinkgem.jeesite.restful.web.api.v1;

import com.google.common.base.Preconditions;
import com.thinkgem.jeesite.common.json.JsonResultModel;
import com.thinkgem.jeesite.modules.project.entity.ProjectInfo;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.restful.web.api.BaseController;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * API 文档地址访问路径： http://localhost:8080/swagger-ui.html
 * 文档写法可参照springfox-petstore.jar包中的controller
 */
@RestController
@RequestMapping(value = "/api",headers="api-version=v1")
@Api(
        value = "/user",
        description = "Operations about user"
)
public class UserControllerApi extends BaseController {

    // @ApiIgnore //使用这个注解忽略这个接口
    @ApiOperation(value = "根据ProjectInfo projectInfo, String[] param1, String param2进行hello方法调用", httpMethod = "POST", produces = "application/json",consumes = "application/x-www-form-urlencoded")
    @ApiResponse(code = 200, message = "success", response = JsonResultModel.class)
    //@ApiImplicitParam(name = "projectInfo", value = "项目实体projectInfo", required = true, dataType = "ProjectInfo",paramType="query")
    @RequestMapping(value = "/hello",method = RequestMethod.POST)
    public JsonResultModel hello(@ApiParam(name = "projectInfo", value = "项目实体类", required = true) ProjectInfo projectInfo, @ApiParam(name = "param1", value = "字符数组", required = true) String[] param1, @ApiParam(name = "param2", value = "字符串", required = true) String param2) {
        try {
            Preconditions.checkNotNull(param1,"参数param1不能为空");
            Preconditions.checkNotNull(param2,"参数param2不能为空");
            jsonResultModel.setStateSuccess();
            jsonResultModel.setData(new User("1","evan"));
            System.out.println(projectInfo);
        }catch (Exception e){
            e.printStackTrace();
            logger.error("参数校验失败：", e);
            jsonResultModel.setMessage(e.getMessage());
            jsonResultModel.setStateError();
        }
        return jsonResultModel;
    }

    /*-----------------------------------restful api demo----------------------------------------------*/

    static Map<String, User> users = Collections.synchronizedMap(new HashMap<String, User>());

    @ApiOperation(value="获取用户列表", notes="")
    @RequestMapping(value={"/users"}, method=RequestMethod.GET)
    public List<User> getUserList() {
        List<User> r = new ArrayList<User>(users.values());
        return r;
    }

    @ApiOperation(value="创建用户", notes="根据User对象创建用户")
    @ApiImplicitParam(name = "user", value = "用户详细实体user", required = true, dataType = "User")
    @RequestMapping(value="/users", method=RequestMethod.POST)
    public String postUser(@RequestBody User user) {
        users.put(user.getId(), user);
        return "success";
    }

    @ApiOperation(value="获取用户详细信息", notes="根据url的id来获取用户详细信息")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "String")
    @RequestMapping(value="/users/{id}", method=RequestMethod.GET)
    public User getUser(@PathVariable String id) {
        return users.get(id);
    }

    @ApiOperation(value="更新用户详细信息", notes="根据url的id来指定更新对象，并根据传过来的user信息来更新用户详细信息")
    /*@ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "String"),
            @ApiImplicitParam(name = "user", value = "用户详细实体user", required = true, dataType = "User")
    })*/
    @RequestMapping(value="/users/{id}", method=RequestMethod.PUT)
    public String putUser(@PathVariable String id,
                          @ApiParam(
                                  value = "Updated user object",
                                  required = true
                          ) @RequestBody User user) {
        User u = users.get(id);
        u.setName(user.getName());
        u.setEmail(user.getEmail());
        users.put(id, u);
        return "success";
    }

    @ApiOperation(value="删除用户", notes="根据url的id来指定删除对象")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "String")
    @RequestMapping(value="/users/{id}", method=RequestMethod.DELETE)
    public String deleteUser(@PathVariable String id) {
        users.remove(id);
        return "success";
    }
}
