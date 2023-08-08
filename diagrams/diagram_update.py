#!/usr/bin/env python
# _*_ coding: utf-8

import pprint
import re
import xml.etree.ElementTree as ET

import tomli  # import tomllib in Python 3.11


def visability(tree, layername, visability):
    root = tree.getroot()

    for form in root.findall("./diagram/mxGraphModel/root"):
        for cell in form.iter("mxCell"):
            try:
                if layername in cell.attrib["value"]:
                    cell.set("visible", visability)
            except KeyError:
                pass
            except Exception as err:
                print(f"Unexpected {err=}, {type(err)=}")
                raise
    return tree


def Convert(string):
    li = list(string.split(","))
    return li


if __name__ == "__main__":
    debugmode = True
    with open("../terraform.tfvar.example") as fileObj:
        content = fileObj.read()
    tfvar_defaults = tomli.loads(content)

    if not tfvar_defaults["nat_gateway"]:
        public_cidr_block01a_ngw_visible = False
        public_cidr_block01b_ngw_visible = False
        public_cidr_block01c_ngw_visible = False
        public_cidr_block01d_ngw_visible = False

    if tfvar_defaults["single_nat_gateway"]:
        public_cidr_block01a_ngw_visible = True
        public_cidr_block01b_ngw_visible = False
        public_cidr_block01c_ngw_visible = False
        public_cidr_block01d_ngw_visible = False

    if (
        not tfvar_defaults["single_nat_gateway"]
        and tfvar_defaults["one_nat_gateway_per_az"]
    ):
        public_cidr_block01a_ngw_visible = True
        public_cidr_block01b_ngw_visible = True
        public_cidr_block01c_ngw_visible = True
        public_cidr_block01d_ngw_visible = True

    try:
        public_cidr_block01a = tfvar_defaults["public_cidr_blocks"][0]
        public_cidr_block01a_visible = True
        public_cidr_block01a_ngw_visible = False
    except IndexError:
        public_cidr_block01a = ""
        public_cidr_block01a_visible = False
        public_cidr_block01a_ngw_visible = False
    try:
        public_cidr_block01b = tfvar_defaults["public_cidr_blocks"][1]
        public_cidr_block01b_visible = True
    except IndexError:
        public_cidr_block01b = ""
        public_cidr_block01b_visible = False
        public_cidr_block01a_ngw_visible = False
    try:
        public_cidr_block01c = tfvar_defaults["public_cidr_blocks"][2]
        public_cidr_block01c_visible = True
    except IndexError:
        public_cidr_block01c = ""
        public_cidr_block01c_visible = False
        public_cidr_block01a_ngw_visible = False
    try:
        public_cidr_block01d = tfvar_defaults["public_cidr_blocks"][3]
        public_cidr_block01d_visible = True
    except IndexError:
        public_cidr_block01d = ""
        public_cidr_block01d_visible = False
        public_cidr_block01a_ngw_visible = False

    try:
        private_cidr_block01a = tfvar_defaults["private_cidr_blocks01"][0]
        private_cidr_block01a_visible = True
    except IndexError:
        private_cidr_block01a = ""
        private_cidr_block01a_visible = False
    try:
        private_cidr_block01b = tfvar_defaults["private_cidr_blocks01"][1]
        private_cidr_block01b_visible = True
    except IndexError:
        private_cidr_block01b = ""
        private_cidr_block01b_visible = False
    try:
        private_cidr_block01c = tfvar_defaults["private_cidr_blocks01"][2]
        private_cidr_block01c_visible = True
    except IndexError:
        private_cidr_block01c = ""
        private_cidr_block01c_visible = False
    try:
        private_cidr_block01d = tfvar_defaults["private_cidr_blocks01"][3]
        private_cidr_block01d_visible = True
    except IndexError:
        private_cidr_block01d = ""
        private_cidr_block01d_visible = False

    try:
        private_cidr_block02a = tfvar_defaults["private_cidr_blocks02"][0]
        private_cidr_block02a_visible = True
    except IndexError:
        private_cidr_block02a = ""
        private_cidr_block02a_visible = False
    try:
        private_cidr_block02b = tfvar_defaults["private_cidr_blocks02"][1]
        private_cidr_block02b_visible = True
    except IndexError:
        private_cidr_block02b = ""
        private_cidr_block02b_visible = False
    try:
        private_cidr_block02c = tfvar_defaults["private_cidr_blocks02"][2]
        private_cidr_block02c_visible = True
    except IndexError:
        private_cidr_block02c = ""
        private_cidr_block02c_visible = False
    try:
        private_cidr_block02d = tfvar_defaults["private_cidr_blocks02"][3]
        private_cidr_block02d_visible = True
    except IndexError:
        private_cidr_block02d = ""
        private_cidr_block02d_visible = False

    try:
        private_cidr_block03a = tfvar_defaults["private_cidr_blocks03"][0]
        private_cidr_block03a_visible = True
    except IndexError:
        private_cidr_block03a = ""
        private_cidr_block03a_visible = False
    try:
        private_cidr_block03b = tfvar_defaults["private_cidr_blocks03"][1]
        private_cidr_block03b_visible = True
    except IndexError:
        private_cidr_block03b = ""
        private_cidr_block03b_visible = False
    try:
        private_cidr_block03c = tfvar_defaults["private_cidr_blocks03"][2]
        private_cidr_block03c_visible = True
    except IndexError:
        private_cidr_block03c = ""
        private_cidr_block03c_visible = False
    try:
        private_cidr_block03d = tfvar_defaults["private_cidr_blocks03"][3]
        private_cidr_block03d_visible = True
    except IndexError:
        private_cidr_block03d = ""
        private_cidr_block03d_visible = False

    filename = "vpc_diagram_template.drawio"
    dst_filename = "vpc_diagram_labelled.drawio"
    filehandle = open(filename, "r")
    content = filehandle.read()
    filehandle.close()

    content = content.replace("%aws_region%", tfvar_defaults["aws_region"])
    content = content.replace(
        "%master_cidr_block%", tfvar_defaults["master_cidr_block"]
    )
    content = content.replace("%public_tier_name%", tfvar_defaults["public_tier_name"])
    content = content.replace(
        "%private01_tier_name%", tfvar_defaults["private01_tier_name"]
    )
    content = content.replace(
        "%private02_tier_name%", tfvar_defaults["private02_tier_name"]
    )
    content = content.replace(
        "%private03_tier_name%", tfvar_defaults["private03_tier_name"]
    )

    content = content.replace("%public_cidr_block01a%", public_cidr_block01a)
    content = content.replace("%public_cidr_block01b%", public_cidr_block01b)
    content = content.replace("%public_cidr_block01c%", public_cidr_block01c)
    content = content.replace("%public_cidr_block01d%", public_cidr_block01d)

    content = content.replace("%private_cidr_block01a%", private_cidr_block01a)
    content = content.replace("%private_cidr_block01b%", private_cidr_block01b)
    content = content.replace("%private_cidr_block01c%", private_cidr_block01c)
    content = content.replace("%private_cidr_block01d%", private_cidr_block01d)

    content = content.replace("%private_cidr_block02a%", private_cidr_block02a)
    content = content.replace("%private_cidr_block02b%", private_cidr_block02b)
    content = content.replace("%private_cidr_block02c%", private_cidr_block02c)
    content = content.replace("%private_cidr_block02d%", private_cidr_block02d)

    content = content.replace("%private_cidr_block03a%", private_cidr_block03a)
    content = content.replace("%private_cidr_block03b%", private_cidr_block03b)
    content = content.replace("%private_cidr_block03c%", private_cidr_block03c)
    content = content.replace("%private_cidr_block03d%", private_cidr_block03d)

    filehandle = open(dst_filename, "w")
    filehandle.write(content)
    filehandle.close()

    tree = ET.parse(dst_filename)
    visability(tree, "Region", "0")
    visability(tree, "VPC", "0")
    tree.write(dst_filename)
