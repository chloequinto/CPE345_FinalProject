//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network ER_Optimize_One
{
    @display("bgb=3270.4436,1947.309");
    submodules:
        source: Source {
            @display("p=69.03311,388.31125");
        }
        source1: Source {
            @display("p=2465.0574,477.479;i=block/ambulance;is=vs");
        }
        passiveQueue2: PassiveQueue {
            @display("p=667.32007,1095.9006");
        }
        passiveQueue3: PassiveQueue {
            @display("p=1124.6644,845.6556");
        }
        classifier: Classifier {
            @display("p=733.4768,546.51215");
        }
        sink: Sink {
            @display("p=2465.0574,1803.49");
        }
        server: Server {
            @display("p=1256.9779,1771.8499");
        }
        server1: Server {
            @display("p=1645.2892,1642.4127");
        }
        server2: Server {
            @display("p=2010.5894,983.7218");
        }
        server3: Server {
            @display("p=2329.8674,983.7218");
        }
        server4: Server {
            @display("p=2522.585,983.7218");
        }
        server5: Server {
            @display("p=2692.2913,983.7218");
        }
        server6: Server {
            @display("p=2850.4922,983.7218");
        }
        server7: Server {
            @display("p=2850.4922,1187.9448");
        }
        server8: Server {
            @display("p=2850.4922,1374.9094");
        }
        server9: Server {
            @display("p=2850.4922,1570.5033");
        }
    connections:
        classifier.rest --> passiveQueue2.in++;
        classifier.out++ --> passiveQueue3.in++;
        passiveQueue3.out++ --> server2.in++;
        passiveQueue3.out++ --> server3.in++;
        server2.out --> sink.in++;
        server3.out --> sink.in++;
        passiveQueue2.out++ --> server.in++;
        passiveQueue2.out++ --> server1.in++;
        server1.out --> sink.in++;
        server.out --> sink.in++;
        source.out --> classifier.in++;
        source1.out --> classifier.in++;
        passiveQueue3.out++ --> server4.in++;
        passiveQueue3.out++ --> server5.in++;
        passiveQueue3.out++ --> server6.in++;
        passiveQueue3.out++ --> server7.in++;
        passiveQueue3.out++ --> server8.in++;
        passiveQueue3.out++ --> server9.in++;
        server4.out --> sink.in++;
        server5.out --> sink.in++;
        server6.out --> sink.in++;
        server7.out --> sink.in++;
        server8.out --> sink.in++;
        server9.out --> sink.in++;
}
