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

import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network ER_Alternate1
{
    @display("bgb=910,606");
    submodules:
        source: Source {
            @display("p=51,155");
        }
        sink: Sink {
            @display("p=815,548");
        }
        ambulance: Source {
            @display("p=51,53");
        }
        passiveQueue: PassiveQueue {
            @display("p=135,155");
        }
        router: Router {
            @display("p=334,53");
        }
        passiveQueue1: PassiveQueue {
            @display("p=442,53");
        }
        passiveQueue2: PassiveQueue {
            @display("p=334,236");
        }
        server: Server {
            @display("p=803,53");
        }
        server1: Server {
            @display("p=739,101");
        }
        server2: Server {
            @display("p=656,134");
        }
        server3: Server {
            @display("p=539,224");
        }
        server4: Server {
            @display("p=595,173");
        }
        server5: Server {
            @display("p=539,322");
        }
        server6: Server {
            @display("p=530,398");
        }
        server7: Server {
            @display("p=481,449");
        }
        server8: Server {
            @display("p=417,497");
        }
        server9: Server {
            @display("p=354,548");
        }
    connections:
        source.out --> passiveQueue.in++;
        ambulance.out --> router.in++;
        passiveQueue.out++ --> router.in++;
        router.out++ --> passiveQueue1.in++;
        router.out++ --> passiveQueue2.in++;
        passiveQueue2.out++ --> server6.in++;
        passiveQueue2.out++ --> server7.in++;
        passiveQueue2.out++ --> server8.in++;
        passiveQueue2.out++ --> server9.in++;
        passiveQueue2.out++ --> server5.in++;
        passiveQueue1.out++ --> server.in++;
        passiveQueue1.out++ --> server1.in++;
        passiveQueue1.out++ --> server2.in++;
        passiveQueue1.out++ --> server3.in++;
        passiveQueue1.out++ --> server4.in++;
        server9.out --> sink.in++;
        server4.out --> sink.in++;
        server3.out --> sink.in++;
        server2.out --> sink.in++;
        server1.out --> sink.in++;
        server.out --> sink.in++;
        server8.out --> sink.in++;
        server7.out --> sink.in++;
        server6.out --> sink.in++;
        server5.out --> sink.in++;
}

