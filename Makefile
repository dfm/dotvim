.PHONY: update commit

update:
	git pull origin
	git submodule foreach git pull origin master

commit: update
	git commit *bundle* -m "Updated plug-ins"
	git push origin
