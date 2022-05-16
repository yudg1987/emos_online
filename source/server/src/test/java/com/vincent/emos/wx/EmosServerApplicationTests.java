package com.vincent.emos.wx;


import com.vincent.emos.wx.db.pojo.MessageEntity;
import com.vincent.emos.wx.task.MessageTask;

import cn.hutool.core.util.IdUtil;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;


@RunWith(SpringRunner.class)
@SpringBootTest
class EmosServerApplicationTests {
	@Autowired
    private MessageTask messageTask;
    @Test
    void contextLoads() {
    	MessageEntity entity = new MessageEntity();
		entity.setSenderId(0);
		entity.setSenderName("你是个大傻逼888");
		entity.setUuid(IdUtil.simpleUUID());
		entity.setMsg("你是个大傻逼888");
		entity.setSendTime(new Date());

		messageTask.sendAsync(1 + "", entity);
    }


}
