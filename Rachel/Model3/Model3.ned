import org.omnetpp.queueing.Allocate;
import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.Fork;
import org.omnetpp.queueing.Merge;
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
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.ResourcePool;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network My_MM1
{
    @display("bgb=837.47,386.78");
    submodules:
        sourceAmbulanceArrivals: Source {
            @display("p=59.76,48.969997");
        }
        sinkDepart: Sink {
            @display("p=807.58997,52.289997");
        }
        sourceWaitingRoom: Source {
            @display("p=59.76,268.91998");
        }
        classiferFirstTriageNurse: Classifier {
            @display("p=130.31,148.56999");
        }
        classifierEmergencyTriageNurse: Classifier {
            @display("p=268.09,293.81998");
        }
        serverFastTrackDoctor: Server {
            @display("p=439.9,108.729996");
        }
        serverEmergencyDoctor: Server {
            @display("p=439.9,293.81998");
        }
        classifierFastTrackTriageNurse: Classifier {
            @display("p=281.37,48.969997");
        }
        passiveQueue: PassiveQueue {
            @display("p=193.39,108.729996");
        }
        passiveQueue1: PassiveQueue {
            @display("p=193.39,218.29");
        }
        passiveQueue2: PassiveQueue {
            @display("p=346.11,341.96");
        }
        passiveQueue3: PassiveQueue {
            @display("p=346.11,248.99998");
        }
        passiveQueue4: PassiveQueue {
            @display("p=346.11,108.729996");
        }
        passiveQueue5: PassiveQueue {
            @display("p=346.11,19.92");
        }
        passiveQueue6: PassiveQueue {
            @display("p=346.11,185.92");
        }
        server1: Server {
            @display("p=807.58997,293.81998");
        }
        router: Router {
            @display("p=531.19995,108.729996");
        }
        Surgery: Server {
            @display("p=530.37,293.81998");
        }
        Bloodwork: Server {
            @display("p=624.99,135.29");
        }
        ScanExamination: Server {
            @display("p=624.99,218.29");
        }
        router1: Router {
            @display("p=690.56,218.29");
        }
        router2: Router {
            @display("p=692.22,135.29");
        }
        router3: Router {
            @display("p=807.58997,198.37");
        }
    connections:
        sourceAmbulanceArrivals.out --> classiferFirstTriageNurse.in++;
        sourceWaitingRoom.out --> classiferFirstTriageNurse.in++;
        classiferFirstTriageNurse.out++ --> passiveQueue.in++;
        classiferFirstTriageNurse.out++ --> passiveQueue1.in++;
        passiveQueue.out++ --> classifierFastTrackTriageNurse.in++;
        classifierFastTrackTriageNurse.out++ --> passiveQueue5.in++;
        classifierFastTrackTriageNurse.out++ --> passiveQueue4.in++;
        passiveQueue4.out++ --> serverFastTrackDoctor.in++;
        passiveQueue5.out++ --> serverFastTrackDoctor.in++;
        passiveQueue1.out++ --> passiveQueue6.in++;
        passiveQueue1.out++ --> classifierEmergencyTriageNurse.in++;
        classifierEmergencyTriageNurse.out++ --> passiveQueue3.in++;
        classifierEmergencyTriageNurse.out++ --> passiveQueue2.in++;
        passiveQueue2.out++ --> serverEmergencyDoctor.in++;
        passiveQueue3.out++ --> serverEmergencyDoctor.in++;
        passiveQueue6.out++ --> serverFastTrackDoctor.in++;
        serverEmergencyDoctor.out --> Surgery.in++;
        Surgery.out --> server1.in++;
        serverFastTrackDoctor.out --> router.in++;
        router.out++ --> sinkDepart.in++;
        router.out++ --> Bloodwork.in++;
        router.out++ --> ScanExamination.in++;
        Bloodwork.out --> router2.in++;
        ScanExamination.out --> router1.in++;
        router2.out++ --> ScanExamination.in++;
        router1.out++ --> Bloodwork.in++;
        router2.out++ --> server1.in++;
        router1.out++ --> server1.in++;
        server1.out --> router3.in++;
        router3.out++ --> classifierFastTrackTriageNurse.in++;
        router3.out++ --> sinkDepart.in++;
}
