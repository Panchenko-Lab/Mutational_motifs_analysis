function mafCaller = importMAFfile(filename, dataLines)
%importMAFfile Import data from a text file
%  TCGA = importMAFfile(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  TCGA = importMAFfile(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  TCGA = importMAFfile("D:\Work\DataAnalysis\AnnaPanchenko\Polymerase\Endometrial\Data\TCGA.UCEC.mutect.d3fa70be-520a-420e-bb6d-651aeee5cb50.DR-10.0.somatic.maf", [7, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 06-Aug-2021 15:56:22

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [7, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 120);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["Hugo_Symbol", "Entrez_Gene_Id", "Center", "NCBI_Build", "Chromosome", "Start_Position", "End_Position", "Strand", "Variant_Classification", "Variant_Type", "Reference_Allele", "Tumor_Seq_Allele1", "Tumor_Seq_Allele2", "dbSNP_RS", "dbSNP_Val_Status", "Tumor_Sample_Barcode", "Matched_Norm_Sample_Barcode", "Match_Norm_Seq_Allele1", "Match_Norm_Seq_Allele2", "Tumor_Validation_Allele1", "Tumor_Validation_Allele2", "Match_Norm_Validation_Allele1", "Match_Norm_Validation_Allele2", "Verification_Status", "Validation_Status", "Mutation_Status", "Sequencing_Phase", "Sequence_Source", "Validation_Method", "Score", "BAM_File", "Sequencer", "Tumor_Sample_UUID", "Matched_Norm_Sample_UUID", "HGVSc", "HGVSp", "HGVSp_Short", "Transcript_ID", "Exon_Number", "t_depth", "t_ref_count", "t_alt_count", "n_depth", "n_ref_count", "n_alt_count", "all_effects", "Allele", "Gene", "Feature", "Feature_type", "One_Consequence", "Consequence", "cDNA_position", "CDS_position", "Protein_position", "Amino_acids", "Codons", "Existing_variation", "ALLELE_NUM", "DISTANCE", "TRANSCRIPT_STRAND", "SYMBOL", "SYMBOL_SOURCE", "HGNC_ID", "BIOTYPE", "CANONICAL", "CCDS", "ENSP", "SWISSPROT", "TREMBL", "UNIPARC", "RefSeq", "SIFT", "PolyPhen", "EXON", "INTRON", "DOMAINS", "GMAF", "AFR_MAF", "AMR_MAF", "ASN_MAF", "EAS_MAF", "EUR_MAF", "SAS_MAF", "AA_MAF", "EA_MAF", "CLIN_SIG", "SOMATIC", "PUBMED", "MOTIF_NAME", "MOTIF_POS", "HIGH_INF_POS", "MOTIF_SCORE_CHANGE", "IMPACT", "PICK", "VARIANT_CLASS", "TSL", "HGVS_OFFSET", "PHENO", "MINIMISED", "ExAC_AF", "ExAC_AF_Adj", "ExAC_AF_AFR", "ExAC_AF_AMR", "ExAC_AF_EAS", "ExAC_AF_FIN", "ExAC_AF_NFE", "ExAC_AF_OTH", "ExAC_AF_SAS", "GENE_PHENO", "FILTER", "CONTEXT", "src_vcf_id", "tumor_bam_uuid", "normal_bam_uuid", "case_id", "GDC_FILTER", "COSMIC", "MC3_Overlap", "GDC_Validation_Status"];
opts.VariableTypes = ["char", "double", "char", "char", "char", "double", "double", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "double", "double", "double", "double", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
%opts.PreserveVariableNames = true;

% Specify variable properties
%opts = setvaropts(opts, ["Hugo_Symbol", "Center", "NCBI_Build", "Chromosome", "Strand", "Variant_Classification", "Variant_Type", "Reference_Allele", "Tumor_Seq_Allele1", "Tumor_Seq_Allele2", "dbSNP_RS", "dbSNP_Val_Status", "Tumor_Sample_Barcode", "Matched_Norm_Sample_Barcode", "Match_Norm_Seq_Allele1", "Match_Norm_Seq_Allele2", "Tumor_Validation_Allele1", "Tumor_Validation_Allele2", "Match_Norm_Validation_Allele1", "Match_Norm_Validation_Allele2", "Verification_Status", "Validation_Status", "Mutation_Status", "Sequencing_Phase", "Sequence_Source", "Validation_Method", "Score", "BAM_File", "Sequencer", "Tumor_Sample_UUID", "Matched_Norm_Sample_UUID", "HGVSc", "HGVSp", "HGVSp_Short", "Transcript_ID", "Exon_Number", "n_ref_count", "n_alt_count", "all_effects", "Allele", "Gene", "Feature", "Feature_type", "One_Consequence", "Consequence", "cDNA_position", "CDS_position", "Protein_position", "Amino_acids", "Codons", "Existing_variation", "ALLELE_NUM", "DISTANCE", "TRANSCRIPT_STRAND", "SYMBOL", "SYMBOL_SOURCE", "HGNC_ID", "BIOTYPE", "CANONICAL", "CCDS", "ENSP", "SWISSPROT", "TREMBL", "UNIPARC", "RefSeq", "SIFT", "PolyPhen", "EXON", "INTRON", "DOMAINS", "GMAF", "AFR_MAF", "AMR_MAF", "ASN_MAF", "EAS_MAF", "EUR_MAF", "SAS_MAF", "AA_MAF", "EA_MAF", "CLIN_SIG", "SOMATIC", "PUBMED", "MOTIF_NAME", "MOTIF_POS", "HIGH_INF_POS", "MOTIF_SCORE_CHANGE", "IMPACT", "PICK", "VARIANT_CLASS", "TSL", "HGVS_OFFSET", "PHENO", "MINIMISED", "ExAC_AF", "ExAC_AF_Adj", "ExAC_AF_AFR", "ExAC_AF_AMR", "ExAC_AF_EAS", "ExAC_AF_FIN", "ExAC_AF_NFE", "ExAC_AF_OTH", "ExAC_AF_SAS", "GENE_PHENO", "FILTER", "CONTEXT", "src_vcf_id", "tumor_bam_uuid", "normal_bam_uuid", "case_id", "GDC_FILTER", "COSMIC", "MC3_Overlap", "GDC_Validation_Status"], "WhitespaceRule", "preserve");
%opts = setvaropts(opts, ["Hugo_Symbol", "Center", "NCBI_Build", "Chromosome", "Strand", "Variant_Classification", "Variant_Type", "Reference_Allele", "Tumor_Seq_Allele1", "Tumor_Seq_Allele2", "dbSNP_RS", "dbSNP_Val_Status", "Tumor_Sample_Barcode", "Matched_Norm_Sample_Barcode", "Match_Norm_Seq_Allele1", "Match_Norm_Seq_Allele2", "Tumor_Validation_Allele1", "Tumor_Validation_Allele2", "Match_Norm_Validation_Allele1", "Match_Norm_Validation_Allele2", "Verification_Status", "Validation_Status", "Mutation_Status", "Sequencing_Phase", "Sequence_Source", "Validation_Method", "Score", "BAM_File", "Sequencer", "Tumor_Sample_UUID", "Matched_Norm_Sample_UUID", "HGVSc", "HGVSp", "HGVSp_Short", "Transcript_ID", "Exon_Number", "n_ref_count", "n_alt_count", "all_effects", "Allele", "Gene", "Feature", "Feature_type", "One_Consequence", "Consequence", "cDNA_position", "CDS_position", "Protein_position", "Amino_acids", "Codons", "Existing_variation", "ALLELE_NUM", "DISTANCE", "TRANSCRIPT_STRAND", "SYMBOL", "SYMBOL_SOURCE", "HGNC_ID", "BIOTYPE", "CANONICAL", "CCDS", "ENSP", "SWISSPROT", "TREMBL", "UNIPARC", "RefSeq", "SIFT", "PolyPhen", "EXON", "INTRON", "DOMAINS", "GMAF", "AFR_MAF", "AMR_MAF", "ASN_MAF", "EAS_MAF", "EUR_MAF", "SAS_MAF", "AA_MAF", "EA_MAF", "CLIN_SIG", "SOMATIC", "PUBMED", "MOTIF_NAME", "MOTIF_POS", "HIGH_INF_POS", "MOTIF_SCORE_CHANGE", "IMPACT", "PICK", "VARIANT_CLASS", "TSL", "HGVS_OFFSET", "PHENO", "MINIMISED", "ExAC_AF", "ExAC_AF_Adj", "ExAC_AF_AFR", "ExAC_AF_AMR", "ExAC_AF_EAS", "ExAC_AF_FIN", "ExAC_AF_NFE", "ExAC_AF_OTH", "ExAC_AF_SAS", "GENE_PHENO", "FILTER", "CONTEXT", "src_vcf_id", "tumor_bam_uuid", "normal_bam_uuid", "case_id", "GDC_FILTER", "COSMIC", "MC3_Overlap", "GDC_Validation_Status"], "EmptyFieldRule", "auto");

% Import the data
mafCaller = readtable(filename, opts);

end