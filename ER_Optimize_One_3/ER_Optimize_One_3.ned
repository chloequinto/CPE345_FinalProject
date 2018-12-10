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
    @display("bgb=10901.478,8284.318;i=misc/building");
    submodules:
        source_waiting_room: Source {
            @display("p=4147.192,372.442;i=block/users");
        }
        source_ambulance: Source {
            @display("p=6351.646,372.442;i=msg/resp");
        }
        level_5_queue: PassiveQueue {
            @display("p=4157.258,2154.124");
        }
        level_3_4_queue: PassiveQueue {
            @display("p=5324.914,2154.124");
        }
        level_1_2_queue: PassiveQueue {
            @display("p=6351.646,2164.19");
        }
        nurse: Server {
            @display("p=4147.192,2969.47");
        }
        nurse1: Server {
            @display("p=4871.944,2969.47");
        }
        nurse2: Server {
            @display("p=6381.8438,2969.47");
        }
        waiting_for_doc: PassiveQueue {
            @display("p=4147.192,3643.892");
        }
        waiting_for_doc1: PassiveQueue {
            @display("p=5214.188,3643.892");
        }
        waiting_for_doc2: PassiveQueue {
            @display("p=6472.438,3643.892");
        }
        doc: Server {
            @display("p=4600.162,4338.446;i=block/user");
        }
        doc1: Server {
            @display("p=5787.95,4257.918;i=block/user");
        }
        wait_for_work: PassiveQueue {
            @display("p=3754.618,5657.092");
        }
        wait_for_work1: PassiveQueue {
            @display("p=5264.518,5657.092");
        }
        Xray: Server {
            @display("p=3754.618,6341.58");
        }
        MRI: Server {
            @display("p=5274.584,6381.8438");
        }
        Surgery: Server {
            @display("p=6381.8438,6240.92");
        }
        router: Router {
            @display("p=6381.8438,4892.076");
        }
        wait_for_result: PassiveQueue {
            @display("p=4328.38,7458.906");
        }
        wait_for_result1: PassiveQueue {
            @display("p=5214.188,7458.906");
        }
        wait_for_result2: PassiveQueue {
            @display("p=6381.8438,7458.906");
        }
        router1: Router {
            @display("p=3754.618,4892.076");
        }
        sink: Sink {
            @display("p=5194.056,4892.076;i=misc/house");
        }
        triage_nurse_ambulance: Router {
            @display("p=6381.8438,1127.392");
        }
        triage_nurse_waiting_room: Router {
            @display("p=4147.192,1258.25");
        }
        nurse3: Server {
            @display("p=5566.498,2969.47");
        }
        wait_for_work2: PassiveQueue {
            @display("p=6381.8438,5657.092");
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
        triage_nurse_waiting_room.out++ --> level_3_4_queue.in++;
        triage_nurse_waiting_room.out++ --> level_5_queue.in++;
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
