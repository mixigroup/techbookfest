textlint *.re > result

if test -s result ; then
  ruby script/post_pr_comment.rb result $CODEBUILD_SOURCE_VERSION $REPO $GH_TOKEN
  exit 1
fi
