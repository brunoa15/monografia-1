# cd ../saidas/heatmap
cd ../top_linguagens

for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo
        prevID="none"
        while IFS= read -r commitID; do
            if [ $prevID != "none" ]; then
                if [ $repo = "Django-Socialauth" ] ||
                [ $repo = "python-beaver" ] ||
                [ $repo = "LINE" ]; then
                    git diff -U0 $commitID $prevID README.rst >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README.rst | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv

                elif [ $repo = "android-pedometer" ]; then
                    git diff -U0 $commitID $prevID README.textile >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README.textile | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv

                elif [ $repo = "event_calendar" ] || 
                [ $repo = "facebooker" ] ||
                [ $repo = "vestal_versions" ]; then
                    git diff -U0 $commitID $prevID README.rdoc >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README.rdoc | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv
                
                elif [ $repo = "droid-fu" ] ||
                [ $repo = "f8DeveloperConferenceApp" ] ||
                [ $repo = "cache-money" ]; then
                    git diff -U0 $commitID $prevID README.makdown >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README.markdown | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv
                
                elif [ $repo = "android-plus-plus" ]; then
                    git diff -U0 $commitID $prevID readme.txt >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:readme.txt | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv

                elif [ $repo = "1pass" ] ||
                [ $repo = "webistrano" ]; then
                    git diff -U0 $commitID $prevID README.txt >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README.txt | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv

                elif [ $repo = "BicaVM" ] ||
                [ $repo = "cloud-crowd" ]; then
                    git diff -U0 $commitID $prevID README >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv

                elif [ $repo = "grunt-shell" ]; then
                    git diff -U0 $commitID $prevID readme.md >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:readme.md | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv

                else
                    git diff -U0 $commitID $prevID README.md >> ../../../saidas/heatmap/$lang/$repo/diff.txt
                    git show $prevID:README.md | wc -l >> ../../../saidas/heatmap/$lang/$repo/nRows.csv
                fi
            fi
            prevID=$commitID
        done < "../../../saidas/heatmap/$lang/$repo/commitIDs.txt"
        cd ..
    done
    cd ..
done