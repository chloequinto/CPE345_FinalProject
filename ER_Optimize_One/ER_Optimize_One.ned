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
    @display("bgb=3895,2731.25;i=misc/building");
    submodules:
        source_waiting_room: Source {
            @display("p=681.70197,115.05518;i=block/users");
        }
        source_ambulance: Source {
            @display("p=1653.9182,115.05518;i=msg/resp");
        }
        level_5_queue: PassiveQueue {
            @display("p=681.70197,581.0287");
        }
        level_3_4_queue: PassiveQueue {
            @display("p=1173.5629,581.0287");
        }
        level_1_2_queue: PassiveQueue {
            @display("p=1653.9182,566.6468");
        }
        nurse: Server {
            @display("p=681.70197,793.88074");
        }
        nurse1: Server {
            @display("p=1173.5629,793.88074");
        }
        nurse2: Server {
            @display("p=1653.9182,779.49884");
        }
        waiting_for_doc: PassiveQueue {
            @display("p=681.70197,975.09265");
        }
        waiting_for_doc1: PassiveQueue {
            @display("p=1173.5629,975.09265");
        }
        waiting_for_doc2: PassiveQueue {
            @display("p=1653.9182,960.71075");
        }
        doc: Server {
            @display("p=911.8123,1199.4503;i=block/user");
        }
        doc1: Server {
            @display("p=1420.9315,1199.4503;i=block/user");
        }
        wait_for_work: PassiveQueue {
            @display("p=555.75,1824");
        }
        wait_for_work1: PassiveQueue {
            @display("p=1187.5,1824");
        }
        Xray: Server {
            @display("p=555.75,2251.5");
        }
        MRI: Server {
            @display("p=1187.5,2208.75");
        }
        Surgery: Server {
            @display("p=1738.5,2208.75");
        }
        router: Router {
            @display("p=1420.25,1567.5");
        }
        wait_for_result: PassiveQueue {
            @display("p=555.75,2565");
        }
        wait_for_result1: PassiveQueue {
            @display("p=1187.5,2565");
        }
        wait_for_result2: PassiveQueue {
            @display("p=1738.5,2565");
        }
        router1: Router {
            @display("p=907.25,1567.5");
        }
        sink: Sink {
            @display("p=1150.5519,1337.5165;i=misc/house");
        }
        triage_nurse_ambulance: Router {
            @display("p=1656.7947,336.5364");
        }
        triage_nurse_waiting_room: Router {
            @display("p=681.70197,362.42383");
        }
        wait_for_work2: PassiveQueue {
            @display("p=1738.5,1824");
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
        MRI.out --> wait_for_result1.in++;
        Surgery.out --> wait_for_result2.in++;
        wait_for_result2.out++ --> doc1.in++;
        wait_for_result.out++ --> doc.in++;
        wait_for_result1.out++ --> doc.in++;
        wait_for_result1.out++ --> doc1.in++;
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
        router.out++ --> wait_for_work2.in++;
        wait_for_work2.out++ --> Surgery.in++;
        router1.out++ --> wait_for_work1.in++;
}
