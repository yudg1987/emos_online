package com.vincent.emos.wx.common.exception;

import lombok.extern.slf4j.Slf4j;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.vincent.emos.wx.common.util.R;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


/**
 * <h1>全局异常处理</h1> Created by dgyu
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionAdvice
{

	@ExceptionHandler(value = MethodArgumentNotValidException.class)
	public R handleVaildException(HttpServletRequest req, MethodArgumentNotValidException ex)
	{
		log.error("1【BusinessException】:\t请求路径：{},\t错误信息：{}", req.getRequestURL(), ex);
		BindingResult bindingResult = ex.getBindingResult();
		Map<String, String> errorMap = new HashMap<>();
		bindingResult.getFieldErrors().forEach((fieldError) -> {
			errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
		});
		return R.error(400, "数据校验失败");
		//return R.failed(errorMap, "数据校验失败");
	}


	/**
	 * <h2>对 BusinessException 进行统一处理</h2> 统一返回 json 格式
	 */
	@ExceptionHandler(value = BusinessException.class)
	public R handlerBusinessException(HttpServletRequest req, BusinessException ex)
	{
		log.error("2【BusinessException】:\t请求路径：{},\t错误信息：{}", req.getRequestURL(), ex);
		//return ResponseDTO.failed(ex.getMessage());
		return R.error(400,ex.getMessage());
	}


	/**
	 * <h2>对 setinel 流控 规则 BlockException 进行统一处理</h2> 统一返回 json 格式
	 */
	@ExceptionHandler(value = Exception.class)
	public R handlerException(HttpServletRequest req, Exception ex)
	{
		if (null != ex.getCause())
		{
			boolean sentinel = ex.getCause().toString().contains("sentinel");
			if (sentinel)
			{
				log.error("【服务器繁忙请稍后再试】:\t请求路径：{}", req.getRequestURL());
				return R.error("服务器繁忙请稍后再试");
			}
		}
		log.error("3【Exception】:\t请求路径：{},\t错误信息：{}", req.getRequestURL(), ex);
		return R.error(500,ex.getMessage());
	}
}
