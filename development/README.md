# Vagrant for development

Macに構築する共通開発サーバーの作業をコントロールする


**文言定義**

|文言|説明|
|:--|:--|
|**guest_machines**|仮想サーバー|
|**host_machines**|Mac|
|**local**|Vagrantfil に定義しているマシーン（ホスト）名|

```
例: config.vm.define :local do |local|
```





## Setup


**作業ディレクトリ**

```
$ pwd
（省略）/development
```




## guest_machines を構築する

```
$ vagrant up local
```

* 初回は bundle install するため時間がかかる
* インストールされるものは **Vagrantfile** を参照
* **/workspaces** ディレクトリが生成される


### workspaces ディレクトリとは

**host_machines**、**guest_machines** の共有ディレクトリ（マウント）となり、開発メンバーはこのディレクトリ内にアプリケーションを配置して開発をする

**host_machines** のエディターを使って編集し **guest_machines** でサーバーを動かすことが可能となる





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

* **.vagrant/machines** 以下に **guest_machines** の設定ファイルが生成される。複数立ち上げている場合はその分生成されるため確認するとよい。
* 起動の確認は VirtualBox でしたほうがわかりやすい。



## 要確認
* 開発メンバー間での個別の開発環境の違いにより発生する問題をなくすことがひとつの目的である。
* **guest_machines** はいつでも再構築できることを前提としている。
* **guest_machines** に共通で必要な設定変更やインストールは共有して進め、変更があった場合、再構築を促す。
* 個々で **guest_machines** にアプリケーションなどインストールや設定をいれる時は、その **guest_machines** を破棄しても困らない状態であること。
