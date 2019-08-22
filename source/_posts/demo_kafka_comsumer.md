---
title: 一个简单的Kafka消费脚本
date: 2019-08-22 08:00:00
---


今天和同事一起排查一个Kafka消息消费异常的问题，发现Python可以快速撸一个Kafka消费者，代码如下：

```Python
import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kafka import KafkaConsumer

consumer = KafkaConsumer('topic_name',
                         auto_offset_reset='earliest',
                         bootstrap_servers=['broker_server'])

for message in consumer:
    print ("%s:%d:%d: key=%s value=%s" % (message.topic, message.partition,message.offset, message.key,message.value))
```