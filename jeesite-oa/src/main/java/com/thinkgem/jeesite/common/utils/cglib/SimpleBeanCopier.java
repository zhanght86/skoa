package com.thinkgem.jeesite.common.utils.cglib;

/**
 * 使用cglib做BeanCopier，并保留基本的扩展点
 * @param <F>
 * @param <T>
 */
public class SimpleBeanCopier<F,T> extends BeanCopier<F,T> {
	public SimpleBeanCopier(Class<F> sourceClass, Class<T> targetClass){
		setSourceClass(sourceClass);
		setTargetClass(targetClass);
		init();
	}

}