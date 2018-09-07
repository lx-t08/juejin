/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.JedisCluster;

/**
 * jedisCluster工具类
 * 
 * @version 2018年3月17日上午11:33:43
 * @author zhuwenbin
 */
@Service
public class JedisClusterUtil {

	@Autowired
	private JedisCluster jedisCluster;
}
