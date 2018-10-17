# Creating the BeerSnob Gem

## Project Idea

I had a few ideas that I was considering for this project at first. I 
tossed around the idea of scraping through each year in the '90s and 
highlighting different trends, fads, pop culture, and new stories. I also 
considered scraping through different songs and returning original songs 
that the new song took samples from. That idea came closest to fuition but 
unfortunately I couldn't find a website conducive to this idea. Perhaps it 
can be a future project for myself to create! I also wanted by first 
project to be something (somewhat) useful. I examined by interestd and 
found that I could create an app at the intersection of alcohol and 
education. I found craftbeer.com to be a viable website for scraping and 
thus BeerSnob was born.

## Starting the Project

I had quite a few delays in starting this project, each one pretty 
frustrating. I'm working on the Visual Studio Code text editor in place 
of the Learn IDE and have had several issues with setup that I've had to 
solve — either through Google, message boards, or speaking with another 
developer or student. After fixing the settings to allow me to submit 
good commit messages (which is a habit I want to form early) and then 
installing rvm to manage my rubies and gems, I was ready to really dive 
in and begin coding.

### Setup

I installed and used bundler to set up my gem, taking the following steps: 
1. Open your terminal and `cd` into the folder in which you want to create 
your gem (usually called `code`).
2. Type in `bundle gem` then your gem name. (Use an underscore instead of 
a hyphen to make your gem name camel case.) Decide whether you want to use 
`rspec`, `minitest`, or neither for development testing, use the MIT 
license for open sourcing regulationg, and a code of conduct for any open 
source contributors to follow. Bundler then initializes a git repo for 
your gem!
3. `cd` into your newly created gem folder and navigate to GitHub. Create 
a new repository with the same name as your gem. Type `git add .` into 
your terminal, then enter the last three lines in the "create a new 
repository on the command line" option displayed on the new page loaded 
in GitHub for your gem repository.
4. Refresh your GitHub page and you'll see your gem and its files now in 
your GitHub repository.
5. To make sure you're working out of the correct repo, click on the green 
"Clone of download" button in your gem's repository. Make sure that "Clone 
with SSH" is selected and not "Clone with HTTPS". Click on the clipboard 
image to copy the link and return to your terminal. Make sure you're in 
the `code` folder, then type `git clone` and paste the link to clone the 
correct repo for your gem project.
6. Your new gem's repo folder should appear in your locael `code` folder. 
Open your text editor of choice and `cd` into the gem folder to start 
working.
7. To test your text editor's connectivity to GitHub, make a change to 
your `README.md` file and save. In the terminal, type `git add .`, 
`git commit -m "Modify README.md"`, and `git push`. When you refresh 
your GitHub page, you should see the updated commit message and two 
commits.

## Scraping

I decided to start my project by creating a `scraper.rb` file. I actually 
began the file in a practice repo to just mess around and see what I could 
come up with, but when it started coming together, I pasted my work into a 
file in my gem repo. For each beer I wanted to store the style name, family 
name, and a brief description of its characteristics. Since some beers 
have a longer description than others, I decided just to store the first 
paragraph of each beer description. Next I wanted to store the listed 
examples of brewery and beer name for each style. This was a little tricky 
because it required me to create a nested array composed of hashes. Then, 
I wanted to stored some of the info from the "Style A-Z" section but not 
all of it. I ran into issues here because the `<li>` tags used had the 
same class name as the "Quanitative Style Statistics" section. I 
decided to index the `<li>` tags and pull each value directly from the 
corresponding line. All information for each beer is being stored as a 
nested hash in an array called `beer_info`.

Next, I wanted to scrape information from "The A-Z of Beer Styles" section 
of the page so that the user could access details on what each beer 
characteristic entails.