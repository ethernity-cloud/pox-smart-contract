pragma solidity ^0.4.0;

/**
 * Copyright (C) 2018, 2019, 2020 Ethernity HODL UG
 *
 * This file is part of ETHERNITY PoX SC.
 *
 * ETHERNITY PoE SC is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

library Models {

    /*
    * used for storing multiple data
    */
    struct Metadata {
        string key;
        string value;
    }

    struct Order {
        uint8 instance;
        address dproc;
        address downer;
        address processor;
        address placedBy;
        uint dpRequest;
        uint doRequest;
        uint timeout;
        mapping(uint => Metadata) metadata;
        uint metadataSize;
        string result;
        uint price;
        OrderStatus status;
    }

    struct DPRequest {
        address dproc;
        uint8 cpuRequest;
        uint8 memoryRequest;
        uint8 storageRequest;
        uint8 bandwidthRequest;
        uint16 duration; //--timeout
        uint8 minPrice;
        uint32 createdAt;
        uint8 price;
        string Metadata1;
        string Metadata2;
        string Metadata3;
        string Metadata4;
        mapping(uint => Metadata) metadata;
        uint metadataSize;
        RequestStatus status;
    }

    struct DORequest {
        address downer;
        // CPU number
        uint8 cpuRequest;
        // Memory in GB
        uint8 memoryRequest;
        // Storage in GB
        uint8 storageRequest;
        uint8 bandwidthRequest;
        uint16 duration;
        uint8 instances;

        uint8 bookedInstances;
        uint32 createdAt;

        uint8 maxPrice;
        uint32 tokens;

        string Metadata1;
        string Metadata2;
        string Metadata3;
        string Metadata4;
        mapping(uint => Metadata) metadata;
        uint metadataSize;
        RequestStatus status;

    }

    enum OrderStatus{
        OPEN,
        PROCESSING,
        CLOSED,
        CANCELED
    }

    enum RequestStatus{
        AVAILABLE,
        BOOKED,
        CANCELED
    }
}
