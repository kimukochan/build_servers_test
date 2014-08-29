# Vagrant for production

AWSに構築する本番サーバーの作業をコントロールする


**文言定義**

|文言|説明|
|:--|:--|
|aws_machines|AWSの仮想マシン|
|**web**|Vagrantfil に定義しているマシーン（ホスト）名|
|aws console|amazon提供のAWSの管理画面|




## Setup

### 1. 作業ディレクトリに移動

```
$ pwd
（省略）/production
```






## 新規EC2サーバーを構築する


### 1. .envを作成する

```
$ vi .env

ACCESS_KEY_ID     = "[access]"
SECRET_ACCESS_KEY = "[secret]"
KEY_PAIR_NAME     = "[user]"
PRIVATE_KEY_PATH  = "~/.ssh/[user].pem"
```

* [ ]の中身は権限ある人に聞く


### 2. 実行する

```
$ vagrant up web --provider=aws
```



## Sample

### ログインする

```
$ vagrant ssh web
```

### 破棄する

```
$ vagrant destroy web
```

* aws console では Instance state が terminate となり数時間後に表示されなくなる



## Tips
* 複数同時に作る場合
http://nmbr8.com/blog/2014/05/22/how-to-define-and-control-multiple-guest-machines-per-Vagrantfile/



## TODO
* vagrant はサーバーの状態を保持しておくものではない。新規構築の作業で一時的に便利に使うもの?
* .vagrant を削除し再度 vagrant up すると新しい **aws_machines** が作成される。
* 一度作られたサーバに変更をする場合はChefを使う?
* 複数同時に作る場合の方法は運用してきめていく。まわりに聞く。
* ひとつのサーバをつくりそれをマスターとしてboxをつくって複数台つくったほうが早いし、安全と思われる。


