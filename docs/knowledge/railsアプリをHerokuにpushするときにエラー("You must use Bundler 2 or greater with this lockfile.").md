MacOS
rails 5.1.6

herokuにpushすると以下のエラーが出る。

```terminal
$ git push heroku master
Total 0 (delta 0), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Ruby app detected
remote:
remote:  !
remote:  !     You must use Bundler 2 or greater with this lockfile.
remote:  !
~省略~
remote:  !     Push rejected, failed to compile Ruby app.
remote:
remote:  !     Push failed
remote: Verifying deploy...
remote:
remote: !       Push rejected to ***.
remote:
To https://git.heroku.com/***.git
 ! [remote rejected] master -> master (pre-receive hook declined)
error: failed to push some refs to 'https://git.heroku.com/***.git'
```

"You must use Bundler 2 or greater with this lockfile."
はどうすればいいんじゃ？と調べた結果、
以下コマンドでビルドパッケージを追加

```terminal
$ heroku buildpacks:set https://github.com/bundler/heroku-buildpack-bundler2
Buildpack set. Next release on rails-tutorial-iwato will use https://github.com/bundler/heroku-buildpack-bundler2.
Run git push heroku master to create a new release using this buildpack.
```

もう一度
git push heroic master
で無事herokuにpushできた。
