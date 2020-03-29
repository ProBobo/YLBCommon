msg=$1

gitpush1() {
	if [ -z "$(git status -s)" ];then
		git push origin master
	else
		echo -e "\033[31m modified/untracked \033[0m"
		git status
	fi
}

if [ -n "$msg" ]; then
   git add .
   git commit -m"${msg}"
   git pull
   echo -e "\033[32m 完成add、commit、pull操作，别忘了push \033[0m"
   gitpush1
else
    echo -e "\033[31m 请添加注释再来一遍 \033[0m"
fi