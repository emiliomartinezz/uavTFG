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

package dronestfg.simulations;

//
// TODO auto-generated type
//
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import simu5g.world.radio.LteChannelControl;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.NR.gNodeB;
import simu5g.common.binder.Binder;
import org.car2x.veins.modules.mobility.traci.TraCIScenarioManagerLaunchd;
import dronestfg.nodes.UAV;

network DronesNetwork
{
    parameters:
        double playgroundSizeX @unit(m);
        double playgroundSizeY @unit(m);
        double playgroundSizeZ @unit(m);
        @display("bgb=995,607");

    submodules:
        manager: TraCIScenarioManagerLaunchd {
            parameters:
                @display("p=50,50");
        }

        channelControl: LteChannelControl {
            @display("p=100,150;is=s");
        }

        binder: Binder {
            @display("p=100,250;is=s");
        }

        carrierAggregation: CarrierAggregation {
            @display("p=100,350;is=s");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=100,450;is=s");
        }

        router: Router {
            @display("p=500,100;is=s");
        }

        server: StandardHost {
            @display("p=700,100;is=s");
        }

        gnb: gNodeB {
            @display("p=500,400;is=l");
        }

        uav[0]: UAV {
            parameters:
                @display("p=200,200");
        }

    connections:
        server.pppg++ <--> {  datarate = 10Gbps; delay = 1ms; } <--> router.pppg++;
        router.pppg++ <--> {  datarate = 10Gbps; delay = 1ms; } <--> gnb.ppp;
}

