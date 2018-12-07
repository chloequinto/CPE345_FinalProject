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


network ER_Optimize_One_3
{
    @display("bgb=6703.75,5029.75;i=misc/building");
    submodules:
        source_waiting_room: Source {
            @display("p=914.5,263.5;i=block/users");
        }
        source_ambulance: Source {
            @display("p=1573.25,279;i=msg/resp");
        }
        level_5_queue: PassiveQueue {
            @display("p=604.5,1240");
        }
        level_3_4_queue: PassiveQueue {
            @display("p=1209,1255.5");
        }
        level_1_2_queue: PassiveQueue {
            @display("p=1782.5,1247.75");
        }
        nurse: Server {
            @display("p=426.25,1774.75");
        }
        nurse1: Server {
            @display("p=930,1790.25");
        }
        nurse2: Server {
            @display("p=1929.75,1782.5");
        }
        waiting_for_doc: PassiveQueue {
            @display("p=410.75,2216.5");
        }
        waiting_for_doc1: PassiveQueue {
            @display("p=1154.75,2208.75");
        }
        waiting_for_doc2: PassiveQueue {
            @display("p=1922,2247.5");
        }
        doc: Server {
            @display("p=813.75,2666;i=block/user");
        }
        doc1: Server {
            @display("p=1410.5,2642.75;i=block/user");
        }
        wait_for_work: PassiveQueue {
            @display("p=341,3665.75");
        }
        wait_for_work1: PassiveQueue {
            @display("p=1123.75,3720");
        }
        Xray: Server {
            @display("p=348.75,4247");
        }
        MRI: Server {
            @display("p=1123.75,4285.75");
        }
        Surgery: Server {
            @display("p=1844.5,4239.25");
        }
        router: Router {
            @display("p=1875.5,3185.25");
        }
        wait_for_result: PassiveQueue {
            @display("p=325.5,4735.25");
        }
        wait_for_result1: PassiveQueue {
            @display("p=1116,4727.5");
        }
        wait_for_result2: PassiveQueue {
            @display("p=1829,4719.75");
        }
        router1: Router {
            @display("p=364.25,3092.25");
        }
        sink: Sink {
            @display("p=1116,3177.5;i=misc/house");
        }
        triage_nurse_ambulance: Router {
            @display("p=1557.75,736.25");
        }
        triage_nurse_waiting_room: Router {
            @display("p=937.75,751.75");
        }
        nurse3: Server {
            @display("p=1480.25,1805.75");
        }
        wait_for_work2: PassiveQueue {
            @display("p=1860,3735.5");
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
        waiting_for_doc1.out++ --> doc1.in++;
        waiting_for_doc2.out++ --> doc1.in++;
        wait_for_work.out++ --> Xray.in++;
        wait_for_work1.out++ --> MRI.in++;
        Xray.out --> wait_for_result.in++;
        doc1.out --> router.in++;
        router.out++ --> wait_for_work1.in++;
        doc.out --> router1.in++;
        router1.out++ --> wait_for_work.in++;
        router1.out++ --> sink.in++;
        router.out++ --> sink.in++;
        source_ambulance.out --> triage_nurse_ambulance.in++;
        source_waiting_room.out --> triage_nurse_waiting_room.in++;
        triage_nurse_waiting_room.out++ --> level_5_queue.in++;
        triage_nurse_waiting_room.out++ --> level_3_4_queue.in++;
        triage_nurse_ambulance.out++ --> level_3_4_queue.in++;
        triage_nurse_ambulance.out++ --> level_1_2_queue.in++;
        level_3_4_queue.out++ --> nurse3.in++;
        nurse3.out --> waiting_for_doc1.in++;
        router.out++ --> wait_for_work2.in++;
        wait_for_work2.out++ --> Surgery.in++;
        Surgery.out --> wait_for_result2.in++;
        MRI.out --> wait_for_result1.in++;
        router1.out++ --> wait_for_work1.in++;
        wait_for_result1.out++ --> doc.in++;
        wait_for_result1.out++ --> doc1.in++;
        wait_for_result2.out++ --> doc1.in++;
        wait_for_result.out++ --> doc.in++;
}
