# Flapper-news
How to use ? : 
Install Ruby 2.2.2 and and Rails 4.2.3
git clone https://github.com/sami602/Flapper-news.git <your-folder>
$ cd <your-folder>
create your repository on github
$ git remote set-url origin https://github.com/<new repository>

$ bundle install

$ rake db:create

$ rake db:migrate

$ rake bower:install

Then you can register through the UI defined in angular, you could choose the role you want the user to have : 

Admin or classic user. (A user unauthenticated is considered as a Guest)

The password must contain at least 8 characters with letters and numbers.

If you want to test the API with the command line "curl" , You must activate http_basic_auth by changing the line in the file "config/initializers/devise.rb" :
(Line 62)   "config.http_authenticatable = false"  into "config.http_authenticatable = true"

Here are some of the tests I have made to test the API :

Create test:

curl -i -u adminnn@adminnn.com:Salami134679 -H "Accept: application/json" -H "Content-type: application/json" -X POST -d "                                                                                                     
{\"title\":\"New title\", \"post\":{\"title\":\"New title\"}}"  http://localhost:3000/api/posts/ 
