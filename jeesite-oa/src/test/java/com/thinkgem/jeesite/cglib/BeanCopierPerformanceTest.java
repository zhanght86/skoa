package com.thinkgem.jeesite.cglib;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.cglib.BeanCopier;
import com.thinkgem.jeesite.common.utils.cglib.SimpleBeanCopier;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * po -> vo copy,list
 * 技术文档:
 * http://www.tuicool.com/articles/iQniIr;
 * http://git.oschina.net/swmwlm/abc
 * 另:可参考dozer ;
 */
public class BeanCopierPerformanceTest {

	@Test
	public void testCglib() throws Exception {
		A a = getA();
		long t1 = System.currentTimeMillis();
		net.sf.cglib.beans.BeanCopier beanCopier = net.sf.cglib.beans.BeanCopier.create(A.class, B.class, false);
		for (int i=0;i<1000000;i++){
			B b = new B();
			beanCopier.copy(a,b,null);
		}
		long t2 = System.currentTimeMillis();
		System.out.println("abc time takes " + (t2 - t1));
	}

	@Test
	public void testSet() throws Exception {
		A a = getA();
		long t1 = System.currentTimeMillis();
		for (int i=0;i<1000000;i++){
			B b = new B();
			b.setF1(a.getF1());
			b.setF2(a.getF2());
			b.setF3(a.getF3());
			b.setF4(a.getF4());
			b.setF5(a.getF5());
		}
		long t2 = System.currentTimeMillis();
		System.out.println("abc time takes " + (t2 - t1));
	}

	private A getA() {
		A a = new A();
		a.setF1(1);
		a.setF2(1);
		a.setF3("aaaa");
		a.setF4(new Date());
		a.setF5("bbbb");
		return a;
	}

	/**
	 * 测试简单的对象拷贝
	 * 使用cglib 该api性能比 beanutils,jodd,dozer工具效率高
	 */
	@Test
	public void testA2B(){
		B b= (B) new SimpleBeanCopier(A.class,B.class).copy(getA());
		System.out.println(b);
	}

	/**
	 * 兼容Guava的Function<F,T>,一个集合的转换可以变得非常简单
	 */
	@Test
	public void testGuavaListsTransform(){
		BeanCopier<A, B> beanCopier = new SimpleBeanCopier<A, B>(A.class, B.class);

		List<A> listA=new ArrayList<A>();
		listA.add(getA());
		listA.add(getA());
		listA.add(getA());
		listA.add(getA());
		listA.add(getA());

		List<B> listB = Lists.transform(listA, beanCopier);
	}

}