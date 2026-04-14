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



import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;
import dronestfg.nodes.UAV;

network DronesNetwork
{
    parameters:
        double playgroundSizeX @unit(m);
        double playgroundSizeY @unit(m);
        double playgroundSizeZ @unit(m);
        @display("bgb=995,607");

    submodules:
        manager: VeinsInetManager {
            parameters:
                @display("p=50,50");
        }

        uav[0]: UAV {
            @display("p=200,200");
        }
        car[0]: UAV {
            parameters:
                @display("p=300,300");
        }
}
