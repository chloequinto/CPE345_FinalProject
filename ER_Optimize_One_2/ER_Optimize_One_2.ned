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


network ER_Optimize_One_2
{
    @display("bgb=8324.348,8622.498;i=misc/building");
    submodules:
        source_waiting_room: Source {
            @display("p=3029.2039,298.15;i=block/users");
        }
        source_ambulance: Source {
            @display("p=4639.214,345.854;i=msg/resp");
        }
        level_5_queue: PassiveQueue {
            @display("p=2564.0898,1741.1959");
        }
        level_3_4_queue: PassiveQueue {
            @display("p=3697.0598,1753.122");
        }
        level_1_2_queue: PassiveQueue {
            @display("p=5104.3276,1848.5299");
        }
        nurse: Server {
            @display("p=2540.238,2504.46");
        }
        nurse1: Server {
            @display("p=3732.838,2468.682");
        }
        nurse2: Server {
            @display("p=5104.3276,2647.572");
        }
        waiting_for_doc: PassiveQueue {
            @display("p=2552.1638,3303.502");
        }
        waiting_for_doc1: PassiveQueue {
            @display("p=3697.0598,3231.9458");
        }
        waiting_for_doc2: PassiveQueue {
            @display("p=5080.476,3482.3918");
        }
        doc: Server {
            @display("p=2468.682,4639.214;i=block/user");
        }
        doc1: Server {
            @display("p=5080.476,4376.842;i=block/user");
        }
        wait_for_work: PassiveQueue {
            @display("p=1693.492,6249.2236");
        }
        wait_for_work1: PassiveQueue {
            @display("p=4078.692,6451.966");
        }
        Xray: Server {
            @display("p=1693.492,7024.4136");
        }
        MRI: Server {
            @display("p=4102.544,7215.23");
        }
        Surgery: Server {
            @display("p=5533.664,7072.1177");
        }
        router: Router {
            @display("p=5509.812,5557.5156");
        }
        wait_for_result: PassiveQueue {
            @display("p=2015.4939,7847.3076");
        }
        wait_for_result1: PassiveQueue {
            @display("p=3398.91,7871.1597");
        }
        wait_for_result2: PassiveQueue {
            @display("p=4973.1416,7847.3076");
        }
        router1: Router {
            @display("p=1681.5659,5485.96");
        }
        sink: Sink {
            @display("p=3303.502,5784.11;i=misc/house");
        }
        triage_nurse_ambulance: Router {
            @display("p=4651.1396,1061.414");
        }
        triage_nurse_waiting_room: Router {
            @display("p=3041.13,977.93195");
        }
        wait_for_work2: PassiveQueue {
            @display("p=5521.738,6296.9277");
        }
        doc2: Server {
            @display("p=3685.1338,4054.8398;i=block/user");
        }
        router2: Router {
            @display("p=4281.434,4877.734");
        }
    connections:
        level_5_queue.out++ --> nurse.in++;
        level_3_4_queue.out++ --> nurse1.in++;
        level_1_2_queue.out++ --> nurse2.in++;
        nurse.out --> waiting_for_doc.in++;
        nurse1.out --> waiting_for_doc1.in++;
        nurse2.out --> waiting_for_doc2.in++;
        waiting_for_doc.out++ --> doc.in++;
        waiting_for_doc1.out++ --> doc.in++;
        waiting_for_doc2.out++ --> doc1.in++;
        wait_for_work.out++ --> Xray.in++;
        wait_for_work1.out++ --> MRI.in++;
        Xray.out --> wait_for_result.in++;
        MRI.out --> wait_for_result1.in++;
        Surgery.out --> wait_for_result2.in++;
        wait_for_result2.out++ --> doc1.in++;
        doc1.out --> router.in++;
        router.out++ --> wait_for_work1.in++;
        doc.out --> router1.in++;
        router1.out++ --> wait_for_work.in++;
        router1.out++ --> sink.in++;
        router.out++ --> sink.in++;
        source_ambulance.out --> triage_nurse_ambulance.in++;
        source_waiting_room.out --> triage_nurse_waiting_room.in++;
        triage_nurse_waiting_room.out++ --> level_3_4_queue.in++;
        triage_nurse_waiting_room.out++ --> level_5_queue.in++;
        triage_nurse_ambulance.out++ --> level_3_4_queue.in++;
        triage_nurse_ambulance.out++ --> level_1_2_queue.in++;
        router1.out++ --> wait_for_work1.in++;
        router.out++ --> wait_for_work.in++;
        wait_for_work2.out++ --> Surgery.in++;
        router.out++ --> wait_for_work2.in++;
        doc2.out --> router2.in++;
        waiting_for_doc1.out++ --> doc2.in++;
        router2.out++ --> sink.in++;
        router2.out++ --> wait_for_work1.in++;
        router2.out++ --> wait_for_work.in++;
        wait_for_result.out++ --> doc.in++;
        wait_for_result1.out++ --> doc.in++;
        wait_for_result1.out++ --> doc2.in++;
        wait_for_result.out++ --> doc2.in++;
}
