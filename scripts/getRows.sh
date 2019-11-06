# cd ../saidas/heatmap
cd ../top_linguagens

for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo
        prevID="none"
        while IFS= read -r commitID; do
            if [ $prevID != "none" ]; then
                if [ $repo = "django" ] ||
                [ $repo = "flask" ] ||
                [ $repo = "ansible" ] ||
                [ $repo = "httpie" ] ||
                [ $repo = "scikit-learn" ] ||
                [ $repo = "scrapy" ]; then
                    continue
                    # git diff -U0 $commitID $prevID README.rst >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    # git show $prevID:README.rst | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv
                elif [ $repo = "elasticsearch" ]; then
                    git diff -U0 $commitID $prevID README.textile >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README.textile | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv
                elif [ $repo = "spring-boot" ]; then
                    continue
                    # git diff -U0 $commitID $prevID README.adoc >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    # git show $prevID:README.adoc | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv
                else
                    continue
                    # git diff -U0 $commitID $prevID README.md >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    # git show $prevID:README.md | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv
                fi
            fi
            prevID=$commitID
        done < "../../../saidas/heatmap/$lang/$repo/commitIDs.txt"
        cd ..
    done
    cd ..
done