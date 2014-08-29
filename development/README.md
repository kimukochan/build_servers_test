# ローカル開発環境


**文言定義**

|文言|説明|
|:--|:--|
|**guest_machines**|仮想サーバー|
|**host_machines**|Mac|
|**local**|Vagrantfil に定義しているマシーン（ホスト）名の例|

```
例: config.vm.define :local do |local|
```





## setup

**Vagrantfile** を元に **guest_machines** を構築する

```
$ pwd
（省略）/development

$ vagrant up local
```

* 初回は bundle install するため時間がかかる
* インストールされるものは **Vagrantfile** を参照
* **.vagrant/machines** 以下に仮想マシンの設定ファイルが生成される（要参照）
* **/workspaces** ディレクトリが生成される





## workspaces ディレクトリとは

**host_machines**、**guest_machines** の共有ディレクトリ（マウント）となり、開発メンバーはこのディレクトリ内にアプリケーションを配置して開発をする

* **host_machines** のエディターを使って編集し **guest_machines** でサーバーを動かすことが可能となる





## Sample

```
$ vagrant ssh local
$ cd workspaces
$ rails new my_app
$ cd my_app
$ rails s
```

**Vagrantfile** に設定されている **private_network** のURLにアクセスする

http://192.168.33.10:3000



## Tips




## その他
開発メンバー間での個別の開発環境の違いにより発生する問題をなくす
