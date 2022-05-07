package com.vincent.emos.wx.config;

import com.rabbitmq.client.ConnectionFactory;
import org.springframework.boot.autoconfigure.amqp.RabbitProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;

@Configuration
public class RabbitMQConfig {
    @Resource
    private RabbitProperties rabbitProperties;

    @Bean
    public ConnectionFactory getFactory() {

        ConnectionFactory factory = new ConnectionFactory();
       /* factory.setHost("106.13.6.212");
        factory.setPort(5672);
        factory.setUsername("guest");
        factory.setPassword("guest");*/
        factory.setHost(rabbitProperties.getHost());
        factory.setPort(rabbitProperties.getPort());
        factory.setUsername(rabbitProperties.getUsername());
        factory.setPassword(rabbitProperties.getPassword());
        return factory;
    }
}
