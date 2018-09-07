/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.common.init;

import java.beans.PropertyEditorSupport;
import java.util.Date;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import com.qhcs.juejin.common.util.DateUtils;

/**
 * 全局的属性编辑器
 * 
 * @version 2018年3月21日下午3:06:22
 * @author zhuwenbin
 */
public class GlobalInitBinder implements WebBindingInitializer {

	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// 转换String类型数据，将一些特殊符号进行转码防止xss攻击，比如<转为&lt; >转为&gt;
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				super.setValue(StringEscapeUtils.escapeHtml4(text));
			}

			@Override
			public void setValue(Object value) {
				super.setValue(value);
			}
		});

		// 转化date类型数据
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				super.setValue(DateUtils.parseDate(text));
			}
		});
	}

}
