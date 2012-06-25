wirb
====
wirb is a trivial client / server app to demonstrate an in-app REPL.  It uses Ruby (1.9.3) and Sinatra.

licence
-------
myfitnessdata is licensed under the GNU Lesser General Public License.

### why the LGPL?
The GPL is specifically designed to reduce the usefulness of GPL-licensed code to closed-source, proprietary software. The BSD license (and similar) don't mandate code-sharing if the BSD-licensed code is modified by licensees. The LGPL achieves the best of both worlds: an LGPL-licensed library can be incorporated within closed-source proprietary code, and yet those using an LGPL-licensed library are required to release source code to that library if they change it.

example session
---------------

    duncan@duncan-laptop ~/wirb $ ruby server.rb 
    [2012-06-25 18:24:42] INFO  WEBrick 1.3.1
    [2012-06-25 18:24:42] INFO  ruby 1.9.3 (2012-04-20) [x86_64-linux]
    == Sinatra/1.3.2 has taken the stage on 4567 for development with backup from WEBrick
    [2012-06-25 18:24:42] INFO  WEBrick::HTTPServer#start: pid=3532 port=4567

At this point, http://localhost:4567/hi is serving the following text:

    I did it my way!

In a new shell, fire up the client, and redefine the hello method on Application:

    duncan@duncan-laptop ~/wirb $ ruby client.rb
    Enter your Ruby commands, finishing with a double-newline.
     
    class Application
      def hello
        "Redefined!"
      end
    end


Refreshing http://localhost:4567/hi, the following text is now served:

    Redefined!
