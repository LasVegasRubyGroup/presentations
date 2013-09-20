all: slow1.txt slow1.html slow1.ct slow2.html slow3.txt

slow1.txt: slow1.rb
	ruby-prof --file=slow1.txt --printer=flat slow1.rb

slow1.html: slow1.rb
	ruby-prof --file=slow1.html --printer=graph_html slow1.rb

slow1.ct: slow1.rb
	ruby-prof --file=slow1.ct --printer=call_tree slow1.rb

slow2.html: slow2.rb
	ruby slow2.rb

slow3.txt: slow3.rb
	ruby `realpath slow3.rb` > slow3.txt
