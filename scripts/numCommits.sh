rm ../saidas/*
cd ../top_linguagens

for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo

        if [ $repo = "django" ] ||
        [ $repo = "flask" ] ||
        [ $repo = "ansible" ] ||
        [ $repo = "httpie" ] ||
        [ $repo = "scikit-learn" ] ||
        [ $repo = "scrapy" ]; then
            git log --pretty=oneline README.rst | wc -l >> ../../../saidas/numCommits.txt
        
        elif [ $repo = "elasticsearch" ]; then
            git log --pretty=oneline README.textile | wc -l >> ../../../saidas/numCommits.txt

        elif [ $repo = "spring-boot" ]; then
            git log --pretty=oneline README.adoc | wc -l >> ../../../saidas/numCommits.txt
        
        else
            git log --pretty=oneline README.md | wc -l >> ../../../saidas/numCommits.txt
        fi

        echo $repo >> ../../../saidas/nameRepo.txt
        echo $lang >> ../../../saidas/lang.txt
        cd ..
    done
    cd ..
done