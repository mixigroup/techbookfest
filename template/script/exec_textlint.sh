textlint *.re > result

if test -s result ; then
  PR_NUM=$(echo ${GITHUB_REF} | sed 's/refs\/pull\/\(.*\)\/merge/\1/')
  ruby script/post_pr_comment.rb result $PR_NUM $GITHUB_REPOSITORY $GH_TOKEN
  exit 1
fi
