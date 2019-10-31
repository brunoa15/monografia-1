cd ../top_linguagens

# GET ALL COMMITS
count=0
for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo
        mkdir -p ../../../saidas/heatmap/$lang/$repo
        if [ $repo = "django" ] ||
        [ $repo = "flask" ] ||
        [ $repo = "ansible" ] ||
        [ $repo = "httpie" ] ||
        [ $repo = "scikit-learn" ] ||
        [ $repo = "scrapy" ]; then
            git log --format=%H README.rst >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        
        elif [ $repo = "elasticsearch" ]; then
            git log --format=%H README.textile >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt

        elif [ $repo = "spring-boot" ]; then
            git log --format=%H README.adoc >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        
        else
            git log --format=%H README.md >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        fi
        
        count=$((count + 1))
        echo status: $count de 50
        cd ..
    done
    cd ..
done

# GET CHANGES IN ROWS
