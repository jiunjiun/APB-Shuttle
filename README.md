# APB
#### 航警局車表
網址位置：[http://apb.jiunjiun.me](http://apb.jiunjiun.me)

---
### 介紹

本專案使用Rails(4.2.0)開發

功能包含：

* [touchSwipe](http://labs.rampinteractive.co.uk/touchSwipe/demos/) - 手機觸摸
* [Slidebars](http://plugins.adchsm.me/slidebars/)


---
###基本設定

使用專案前, 請做以下設定：

設定database

```
cd config
cp database.yml.sample database.yml
```

建立基本環境資料

```
cd lib/tasks/
cp dev.rake.sample dev.rake
```

建立管理者資料

```
cd lib/tasks/
cp user.rake.sample user.rake
```
並設定`user.rake`的管理者基本帳戶設定 範例如下

```
u = User.new({username: 'sample', email: 'sample@aa.com',
              password: 'test1234', password_confirmation: 'test1234'})
u.save!
```
Update gem

```
bundle install
```
接著 Migrate

```
rake dev:build
rake user:build
```

---


## Copyright / License
* Copyright (c) 2015 jiunjiun (quietmes At gmail.com)
* Licensed under GPL licenses.