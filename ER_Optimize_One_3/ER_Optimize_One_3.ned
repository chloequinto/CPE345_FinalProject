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
    @display("bgb=4826,3871.25;i=misc/building");
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
            @display("p=1061.384,779.49884");
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
            @display("p=911.8123,1544.6158");
        }
        wait_for_work1: PassiveQueue {
            @display("p=1420.9315,1521.6049");
        }
        Xray: Server {
            @display("p=523.5011,1610.7726");
        }
        MRI: Server {
            @display("p=1156.3046,1610.7726");
        }
        Surgery: Server {
            @display("p=1708.5695,1610.7726");
        }
        router: Router {
            @display("p=1420.9315,1372.0331");
        }
        wait_for_result: PassiveQueue {
            @display("p=523.5011,1803.49");
        }
        wait_for_result1: PassiveQueue {
            @display("p=1156.3046,1803.49");
        }
        wait_for_result2: PassiveQueue {
            @display("p=1708.5695,1803.49");
        }
        router1: Router {
            @display("p=911.8123,1372.0331");
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
        nurse3: Server {
            @display("p=1314.5055,793.88074");
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
        wait_for_work.out++ --> MRI.in++;
        wait_for_work1.out++ --> MRI.in++;
        wait_for_work1.out++ --> Surgery.in++;
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
        level_3_4_queue.out++ --> nurse3.in++;
        nurse3.out --> waiting_for_doc1.in++;
}
