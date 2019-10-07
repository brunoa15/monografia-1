rm ../saidas/*
cd ../top_linguagens

for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo
        git log --pretty=oneline README.* | wc -l >> ../../../saidas/numCommits.txt
        echo $repo >> ../../../saidas/nameRepo.txt
        echo $lang >> ../../../saidas/lang.txt
        cd ..
    done
    cd ..
done