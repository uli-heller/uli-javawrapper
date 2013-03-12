/*
 * Copyright 2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import java.util.jar.JarFile;

def cli = new CliBuilder(usage: 'grep-jars [-h] [-d dir] className', posix: true)
cli.h( longOpt: 'help', required: false, 'show usage information' )
cli.d( longOpt: 'dir',  argName: 'directory', required: false, args: 1, 'Directory to scan (default: ".")' )
//cli.m( longOpt: 'mainclass', argName: 'mainclass', required: true, args: 1, 'fully qualified main class, eg. HelloWorld' )
//cli.c( longOpt: 'groovyc', required: false, 'Run groovyc' )

//--------------------------------------------------------------------------
def opt = cli.parse(args)
if (!opt) { return }
if (opt.h) {
  cli.usage();
  return
}

def directoryName = ".";
if (opt.d) {
  directoryName = opt.d;
}

def getPatterns = { String[] args ->
  def p = [];
  args.each {
    p << ~/${it.replaceAll(~/\./, '/')}/;
  }
  return p;
};

def patterns = getPatterns(args);

def result = [];

new File(directoryName).eachFileRecurse {
  if (it.name =~ ~/\.jar$/) {
    //println it;
    JarFile jarFile = new JarFile(it);
    jarFile.entries().each { def entry ->
      //println "  ${entry}";
      patterns.each { def pattern ->
        if (entry.name =~ pattern) {
          result << jarFile;
        }
      }
    }
  }
}

result.unique().each {
  println it.name
}
return;
