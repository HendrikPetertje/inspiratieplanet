[<img src="http://i.creativecommons.org/l/by-nc-nd/3.0/88x31.png">](
http://creativecommons.org/licenses/by-nc-nd/3.0/) click the image to view the license Deed

# Inspiratieplanet web-app #

This is the official project-hub of Dreamteam's Inspiratieplanet. 
This project is currently maintained by:
<table>
<tr>
<td><b><a href="https://github.com/amonfog/">Peter van der Meulen</a></b></td><td>Product Owner</td>
</tr>
<tr>
<td><b><a href="https://github.com/TjerG">Tjerk Jansma</a></b></td><td>Scrum Master / Contributor</td>
</tr>
<tr>
<td><b><a href="https://github.com/bj0rno">Bjorn Postma</a></b></td><td>Contributor</td>
</tr>
<tr>
<td><b><a href="https://github.com/Claudia1234">Ilse Kroes</a></b></td><td>Contributor</td>
</tr>
<tr>
<td><b><a href="http://flavors.me/jorisbakker">Joris Bakker</b></td><td>Contributor</td>
</tr>
<tr>
<td><b><a href="http://madmaniac92.hyves.nl/">Michiel Miedema</a></b></td><td>Contributor</td>
</tr>
</table>
##Documentation
This project is completely documentated in the <b>[Inspiratieplanet Wiki](https://github.com/amonfog/inspiratieplanet/wiki)</b>.

##Projectsite
Research, concepting, design and production are discussed on the official <b>[Geen Inspiratie Blog](http://www.geeninspiratie.kaboomreclame.nl)
##Installation
Follow these instructions to deploy your own local and remote Inspiratieplanet app. 

1. Download and install <b>ruby 1.9.3</b>, <b>rails 3.2.12</b> and the latest version of <b>Git</b>. instructions for Windows and Mac can be found [here](http://railsinstaller.org/).

2. Download this repository as a zip-file to your local computer and extract it or clone it using your favorite (git enabled) console by pasting the code bellow.

    `git clone git@github.com:amonfog/inspiratieplanet.git`

3. Some rubygems need to be installed to your system to get your ready for the site. run the commands below in your terminal.

    `gem install carrierwave capistrano`

4. Install imagemagick to your computer to get the images part of the site running correctly this can be done using the following methods:

####Windows and Mac:
Go to [this website](http://www.imagemagick.org/script/index.php) and download the latest version for your system.

####Ubuntu
Run the following commands in your terminal

    sudo apt-get update
    sudo apt-get install imagemagick

####CentOS
Run the following commands in your terminal
    yum update
    yum install imagemagick

####Suse
Run the following commands in your terminal

    zypper install imagemagick

5. point your shell to the inspiratieplanet folder you just extracted or cloned and run the command below.

    `bundle`

6. If Bundler finishes without errors create a sqlite-database using the following command.

    `rake db:migrate`

if the command above doesn't work try running it with `bundle exec rake db:migrate`.

7. Now start the server using the command below.

    `Rails s`

**You now have a local server which can be accessed in your browser by filling out the address `localhost:3000`**

The website has everything setup for deploying with capistrano. just edit the database settings in [database.yml](https://github.com/amonfog/inspiratieplanet/blob/master/config/database.yml#L21), add local and deploy keys to the Github project and deploy using `cap deploy` followed by `cap deploy:migrations`. You can add categories by running `cap bootstrap` and an admin by running `cap addadmin`.

## Feedback and support
Having questions or requests? visit [Kaboomreclame](http://www.kaboomreclame.nl/contact) for info and contact.