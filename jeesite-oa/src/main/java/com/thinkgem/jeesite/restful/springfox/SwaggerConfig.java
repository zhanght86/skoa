package com.thinkgem.jeesite.restful.springfox;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableWebMvc//如果没加这个会报错
@EnableSwagger2//上面三个注释都是必要的，无添加便会出现莫名奇妙的错误
@ComponentScan(basePackages="com.thinkgem.jeesite.restful.web.api")//添加这个注释，会自动扫描该类中的每一个方法自动生成api文档
public class SwaggerConfig {
	@Bean
	public Docket statelessRestfullApi() {
		return new Docket(DocumentationType.SWAGGER_2)
				.groupName("all")
				.genericModelSubstitutes(DeferredResult.class)
				//.genericModelSubstitutes(ResponseEntity.class)
				.useDefaultResponseMessages(false)
				.forCodeGeneration(true)
				//.pathMapping("/api")//api测试请求地址
				.pathMapping("/")//api测试请求地址
				.select()
				//.paths(PathSelectors.any())//过滤的接口
				.paths(PathSelectors.regex("/api/.*"))//过滤的接口
				.build()
				.apiInfo(statelessRestfullApiInfo());
	}

	private ApiInfo statelessRestfullApiInfo() {
		Contact contact = new Contact("evan", "https://swmwlm.github.io", "81367070@qq.com");
		StringBuilder sb=new StringBuilder();
		sb.append("1.客户端需要申请appId和appKey").append("<br />");
		sb.append("2.算法步骤a):按nonce+appKey+timestamp字符串拼装,使用该字符串对参数map集合产生的待加密字符串进行HmacSHA256信息摘要,防止数据被篡改,并防止重放攻击.").append("<br />");
		sb.append("3.算法步骤b):参数map集合由appId,timestamp,nonce固定参数以及待调用api方法中的参数组成,待加密的字符串是通过遍历map集合key,以及value拼装得到.").append("<br />");
		sb.append("   待加密字符串形如:appId:appIdStrcontent:内容是什么nonce:1111param1:1param12param11param2:param2projectName:项目标题timestamp:1478825956").append("<br />");
		ApiInfo apiInfo = new ApiInfo("首科OA平台restful api",//大标题
				sb.toString(),
				"v1",//版本
				"https://oa.shoukeplus.com",
				contact,//作者
				"Apache Licence 2.0",//licenses链接显示文字
				"http://www.apache.org/licenses/"//licenses链接
		);
		return apiInfo;
	}

	/*@Bean
	public Docket demoApi() {
		return new Docket(DocumentationType.SWAGGER_2)
				.groupName("demo")
				.genericModelSubstitutes(DeferredResult.class)
				//  .genericModelSubstitutes(ResponseEntity.class)
				.useDefaultResponseMessages(false)
				.forCodeGeneration(false)
				.pathMapping("/")
				.select()
				.paths(PathSelectors.regex("/comm.*"))//过滤的接口
				.build()
				.apiInfo(demoApiInfo());
	}

	private ApiInfo demoApiInfo() {
		Contact contact = new Contact("王念", "http://my.oschina.net/wangnian", "2251181679@qq.com");
		ApiInfo apiInfo = new ApiInfo("某API接口",//大标题
				"REST风格API",//小标题
				"0.1",//版本
				"www.baidu.com",
				contact,//作者
				"主页",//链接显示文字
				""//网站链接
		);
		return apiInfo;
	}*/
}