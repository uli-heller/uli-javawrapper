ULI-JAVAWRAPPER
===============

I'd like to build self-contained executables for java programs and groovy scripts.

Java
----

### Traditional way

* Create a jar file containing all required .class and .jar files
* Register the main class (entry point) within META-INF/MANIFEST.MF
* Run the application:
    * Shell/Command line: Executing `java -jar {name}.jar`
    * Desktop: Double-click on the jar file (depends on your OS, might not work)

### My way

* Create a jar file as before
* Generate a shell script/batch file out of this by concatenating a stub script and the jar file
* Run the application:
    * Unix terminal: Execute `./{name}.sh`
    * Unix desktop: Double-click on the sh file
    * Windows command line window: Execute `.\{name}.bat`
    * Windows desktop: Double-click on the bat file
* Example: `ant http-cat` generates bin/http-cat.sh and bin/http-cat.bat
    * Unix: `bin/http-cat.sh http://google.com`
    * Windows: `bin\http-cat.bat http://google.com`
    * Note-1: The sh/bat file is completely self-contained. It only depends on Java. Feel free to copy it to other systems and use it there, too.
    * Note-2: Yes, the advantage of packaging it like this isn't very great. Look at the groovy example for a greater benefit!

Groovy
------

### Traditional way

TBD

### My way

* Create a jar file containing all the required java classes and jar files
* Compile the groovy script and add the class files to the jar file
* Register the groovy script as main class (entry point) within META-INF/MANIFEST.MF
* Generate a shell script/batch file out of this by concatenating a stub script and the jar file
* Run the application:
    * Unix terminal: Execute `./{name}.sh`
    * Unix desktop: Double-click on the sh file
    * Windows command line window: Execute `.\{name}.bat`
    * Windows desktop: Double-click on the bat file
* Example: `ant grep-jars` generates bin/grep-jars.sh and bin/grep-jars.bat
    * Unix: `./grep-jars.sh Logger`
    * Windows: `.\grep-jars.bat Logger`
    * Note: The sh/bat file is completely self-contained. It only depends on Java. Feel free to copy it to other systems and use it there, too.

Cloning The GitHub Repo
-----------------------

To clone the GitHub repository of this project, it is probably best to run `git clone https://github.com/uli-heller/uli-javawrapper.git --single-branch`. This prevents you from downloading the "downloads" branch which contains all the binaries created by this project.

Requirements
------------

To compile and use this project, you'll need

* Internet access to download various 3rd-party tools
    * Groovy
* Either JDK7 (preferred) or JDK6 installed and available via PATH

Project Structure
-----------------

* . ... the root folder
* bin ... various shell scripts
    * ant.sh ... wrapper for ant
    * groovy.sh ... wrapper for groovy
    * myjar.sh ... wrapper for JDK jar
    * prepare.sh ... downloads and unpacks the project dependencies
* build ... files generated when doing the compilation
    * classes ... compiled Java class files
* groovy-scripts ... various groovy scripts
* scripts ... wrapper scripts
* src ... various source files


Compile Project
---------------

### Compile Using A Preinstalled ANT

```sh
ant
```

### Compile Without A Preinstalled ANT

```sh
bin/ant.sh
```

GitHub
------

### Publish Project On GitHub

```sh
git remote add origin git@github.com:uli-heller/uli-javawrapper.git
git push -u origin master
```

### Store Build Artifacts On GitHub

```sh
$ git checkout master
$ git status
# On branch master
nothing to commit, working directory clean
$ git checkout --orphan downloads
$ git rm -rf .
$ jmacs README.txt # Enter description of the branch
$ git add README.txt
$ git commit -m "Created branch: downloads"
$ git push --set-upstream origin downloads
$ cp .../groovy.sh ./groovy-0.1.sh
$ cp .../groovy.bat ./groovy-0.1.bat
$ cp .../grep-jars.sh ./grep-jars-0.1.sh
$ cp .../grep-jars.bat ./grep-jars-0.1.bat
$ git add groovy*.bat groovy*.sh grep-jars*.bat grep-jars*.sh
$ git commit -m "Added downloads of version 0.1" .
$ git push # might take some time depending on your internet connection bandwidth
$ git checkout master # switch back to master
```

### Tags

#### Create A Tag Locally

```sh
git tag -a -m "Version 0.1" v0.1
```

#### Push To GitHub

```sh
git push --tags
```

#### Fetch From GitHub

```sh
git fetch --tags
```

Third Party Products And Tools
------------------------------

Here is a list of the 3rd party products and tools we are using for this project:

* [GitHub](http://github.com) ... for hosting the source code
* [Git](http://git-scm.org) ... for accessing hosted source code
* [Groovy](http://groovy.codehaus.org) ... a scripting language for the Java VM
* [Java](http://java.oracle.com) ... the programming language and execution environment we use
* Linux, Bash, ...

Links And Notes
---------------

* [ReallyExecutableJars](http://skife.org/java/unix/2011/06/20/really_executable_jars.html)
* [WrappingGroovyScript](http://groovy.codehaus.org/WrappingGroovyScript)

Problems And Issues
-------------------

None known.
